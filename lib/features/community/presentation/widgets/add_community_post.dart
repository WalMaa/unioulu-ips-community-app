import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../../../core/utils/config.dart';
import 'dart:convert';

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
  final _pollQuestionController = TextEditingController();
  final _pollOptionController = TextEditingController();
  List<String> _pollOptions = [];
  File? _selectedImage;

  @override
  void dispose() {
    _postTitleController.dispose();
    _contentController.dispose();
    _authorNameController.dispose();
    _authorTitleController.dispose();
    _pollQuestionController.dispose();
    _pollOptionController.dispose();
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
      bucketId: "buckekt_k",
      file: _selectedImage!,
      fileId: 'unique()',
    );

    final fileId = response['\$id'];
    return '${appwriteService.endpoint}/storage/buckets/storage/files/$fileId/view?project=$appwriteProjectId&mode=admin';
  }

  void _addPollOption() {
    if (_pollOptionController.text.isNotEmpty) {
      setState(() {
        _pollOptions.add(_pollOptionController.text);
        _pollOptionController.clear();
      });
    }
  }

  void _submitForm() async {
    final currentContext = context;

    if (_formKey.currentState!.validate()) {
      try {
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(content: Text('Adding post...')),
        );

        final appwriteService = AppwriteService();

        // Upload Image and get URL
        final imageUrl = await _uploadImage(appwriteService);
        if (!mounted) return;

        if (imageUrl == null) {
          ScaffoldMessenger.of(currentContext).showSnackBar(
            const SnackBar(content: Text('Failed to upload image.')),
          );
          return;
        }

        // Prepare poll options correctly
        List<Map<String, dynamic>> formattedPollOptions = _pollOptions
            .map((option) => {'option': option, 'votes': 0})
            .toList();

        final dataObj = {
          'postTitle': _postTitleController.text,
          'content': _contentController.text,
          'imageUrl': imageUrl,
          'authorName': _authorNameController.text,
          'authorTitle': _authorTitleController.text,
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String(),
          'pollQuestion': _pollQuestionController.text,
          'pollOptions': formattedPollOptions,
        };

        print('Data being sent to Appwrite: ${jsonEncode(dataObj)}');

        final response = await appwriteService.createDocument(
          collectionId: "posts",
          data: dataObj,
          documentId: 'unique()',
        );
        print('Document created: ${response['\$id']}');

        if (!mounted) return;

        ScaffoldMessenger.of(currentContext).clearSnackBars();

        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(content: Text('Post added successfully!')),
        );
        Navigator.of(currentContext).pop();
      } catch (e) {
        if (!mounted) return;

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

              // Poll Question Field with space
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _pollQuestionController,
                  decoration: const InputDecoration(
                    labelText: 'Poll Question',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a poll question';
                    }
                    return null;
                  },
                ),
              ),

              // Poll Option Field with space
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _pollOptionController,
                  decoration: const InputDecoration(
                    labelText: 'Poll Option',
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              
              // Add Poll Option button with space
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: _addPollOption,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  child: const Text('Add Poll Option', style: TextStyle(color: Colors.white)),
                ),
              ),
              
              // Display Poll Options with space
              if (_pollOptions.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Poll Options:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ..._pollOptions.map((option) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        elevation: 5,
                        shadowColor: Colors.grey.withOpacity(0.2),
                        child: ListTile(
                          title: Text(option, style: TextStyle(fontSize: 16)),
                          trailing: Icon(Icons.check_circle, color: Colors.green),
                        ),
                      );
                    }).toList(),
                  ],
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
