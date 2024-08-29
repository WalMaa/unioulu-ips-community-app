import 'package:flutter/material.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../../../core/utils/icon_map.dart';
import '../../../../core/utils/icon_names.dart';

class TopicForm extends StatefulWidget {
  const TopicForm({super.key});

  @override
  _TopicFormState createState() => _TopicFormState();
}

class _TopicFormState extends State<TopicForm> {
  final _formKey = GlobalKey<FormState>();
  final _textEnController = TextEditingController();
  final _textFiController = TextEditingController();
  final _textSvController = TextEditingController();
  String? _selectedIconName;

  @override
  void dispose() {
    _textEnController.dispose();
    _textFiController.dispose();
    _textSvController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Retrieve the AppwriteService instance
      final appwriteService = AppwriteService();

      // Create the data object to send
      final data = {
        'text_en': _textEnController.text,
        'text_fi': _textFiController.text,
        'text_sv': _textSvController.text,
        'icon': _selectedIconName ?? '',
      };

      // Create the request body with documentId and permissions
      final body = {
        'documentId': 'unique()', // Generates a unique ID
        'data': data,
        'permissions': [
          'read("any")', // Grant read access to any user
          'update("any")', // Grant update access to any user
          'delete("any")', // Grant delete access to any user
        ],
      };

      // Make an HTTP request to add a new topic
      final response = await appwriteService.makeRequest(
        'POST',
        'databases/communitydb/collections/topics/documents',
        body,
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Topic added successfully!')),
        );
        Navigator.of(context).pop(); // Close the form on success
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Failed to add topic. Error: ${response.body}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Topic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _textEnController,
                  decoration:
                      const InputDecoration(labelText: 'Text (English)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the text in English';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _textFiController,
                  decoration:
                      const InputDecoration(labelText: 'Text (Finnish)'),
                ),
                TextFormField(
                  controller: _textSvController,
                  decoration:
                      const InputDecoration(labelText: 'Text (Swedish)'),
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _selectedIconName,
                  items: iconNames.map((iconName) {
                    return DropdownMenuItem<String>(
                      value: iconName,
                      child: Center(
                          child: Icon(iconMap[iconName] ?? Icons.help,
                              size: 40.0)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedIconName = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Select Icon'),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
