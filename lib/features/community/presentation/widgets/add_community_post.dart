import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../../../core/utils/config.dart';

class CommunityPostForm extends StatefulWidget {
  const CommunityPostForm({super.key});

  @override
  CommunityPostFormState createState() => CommunityPostFormState();
}

class CommunityPostFormState extends State<CommunityPostForm> {
  final _formKey = GlobalKey<FormState>();
  final _postTitleController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorNameController = TextEditingController();
  final _authorTitleController = TextEditingController();
  File? _selectedImage;

  @override
  void dispose() {
    _postTitleController.dispose();
    _contentController.dispose();
    _authorNameController.dispose();
    _authorTitleController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
      });
    }
  }

  Future<String?> _uploadImage(AppwriteService appwriteService) async {
    if (_selectedImage == null) return null;

    final response = await appwriteService.uploadFile(
        bucketId: "storage",
        file: _selectedImage!,
        fileId: 'unique()' // This generates a unique ID for each file
        );

      final fileId = response['\$id'];
      return '${appwriteService.endpoint}/storage/buckets/storage/files/$fileId/view?project=$appwriteProjectId&mode=admin';

  }

  void _submitForm() async {
  // Store context before async gap
  final currentContext = context;
  
  if (_formKey.currentState!.validate()) {
    try {
      // Show loading indicator
      ScaffoldMessenger.of(currentContext).showSnackBar(
        const SnackBar(content: Text('Adding post...')),
      );
      
      final appwriteService = AppwriteService();
      
      // Upload the image and get its URL
      final imageUrl = await _uploadImage(appwriteService);
      
      // Check if widget is still mounted
      if (!mounted) return;

      if (imageUrl == null) {
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(content: Text('Failed to upload image.')),
        );
        return;
      }

      // Create the post data
      final data = {
        'postTitle': _postTitleController.text,
        'content': _contentController.text,
        'imageUrl': imageUrl,
        'authorName': _authorNameController.text,
        'authorTitle': _authorTitleController.text,
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(), // Add this for sorting
      };

      // Make the request to create a new document
      // Fix: pass data directly and documentId as a separate parameter
      await appwriteService.createDocument(
        collectionId: "posts",
        data: data,
        documentId: 'unique()', // Pass as separate parameter
      );
      
      // Check if widget is still mounted after second async operation
      if (!mounted) return;
      
      // Clear loading snackbar
      ScaffoldMessenger.of(currentContext).clearSnackBars();
      
      // Show success and navigate
      ScaffoldMessenger.of(currentContext).showSnackBar(
        const SnackBar(content: Text('Post added successfully!')),
      );
      Navigator.of(currentContext).pop();
    } catch (e) {
      // Check if widget is still mounted
      if (!mounted) return;
      
      // Show error message
      ScaffoldMessenger.of(currentContext).showSnackBar(
        SnackBar(content: Text('Error adding post: ${e.toString()}')),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Select Image'),
              ),
              if (_selectedImage != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Selected Image: ${_selectedImage!.path}'),
                ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _postTitleController,
                decoration: const InputDecoration(labelText: 'Post Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a post title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter content for the post';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _authorNameController,
                decoration: const InputDecoration(labelText: 'Author Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the author name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorTitleController,
                decoration: const InputDecoration(labelText: 'Author Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the author title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
