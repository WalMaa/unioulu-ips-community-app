import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/http_appwrite_service.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleEnController = TextEditingController();
  final _titleFiController = TextEditingController();
  final _titleSvController = TextEditingController();
  final _locationEnController = TextEditingController();
  final _locationFiController = TextEditingController();
  final _locationSvController = TextEditingController();
  final _dateTimeController = TextEditingController();
  final _priceController = TextEditingController();
  final _organizerNameController = TextEditingController();
  final _detailsEnController = TextEditingController();
  final _detailsFiController = TextEditingController();
  final _detailsSvController = TextEditingController();
  final _ticketDetailsEnController = TextEditingController();
  final _ticketDetailsFiController = TextEditingController();
  final _ticketDetailsSvController = TextEditingController();
  final _locationUrlController = TextEditingController();

  File? _selectedPosterPhoto;

  @override
  void dispose() {
    _titleEnController.dispose();
    _titleFiController.dispose();
    _titleSvController.dispose();
    _locationEnController.dispose();
    _locationFiController.dispose();
    _locationSvController.dispose();
    _dateTimeController.dispose();
    _priceController.dispose();
    _organizerNameController.dispose();
    _detailsEnController.dispose();
    _detailsFiController.dispose();
    _detailsSvController.dispose();
    _ticketDetailsEnController.dispose();
    _ticketDetailsFiController.dispose();
    _ticketDetailsSvController.dispose();
    _locationUrlController.dispose();
    super.dispose();
  }

  Future<void> _pickPosterPhoto() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _selectedPosterPhoto = File(result.files.single.path!);
      });
    }
  }

  Future<String?> _uploadPosterPhoto(AppwriteService appwriteService) async {
    if (_selectedPosterPhoto == null) return null;

    // Replace storage with the actual ID of your Appwrite storage bucket
    final response = await appwriteService.uploadFile(
        'storage/buckets/storage/files',
        _selectedPosterPhoto!,
        'unique()' // This will generate a unique ID for each file in Appwrite
        );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      final fileId = responseData['\$id'];
      return '${appwriteService.endpoint}/storage/buckets/storage/files/$fileId/view';
    } else {
      // Log the error response for debugging purposes
      print('Error uploading file: ${response.body}');
      return null;
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final appwriteService = AppwriteService();

      // Upload the poster photo and get its URL
      final posterPhotoUrl = await _uploadPosterPhoto(appwriteService);

      if (posterPhotoUrl == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to upload poster photo.')),
        );
        return;
      }

      // Create the event data with a unique document ID
      final data = {
        'posterPhotoUrl': posterPhotoUrl,
        'title_en': _titleEnController.text.isNotEmpty
            ? _titleEnController.text
            : 'Default Title',
        'title_fi': _titleFiController.text.isNotEmpty
            ? _titleFiController.text
            : 'Oletusotsikko',
        'title_sv': _titleSvController.text.isNotEmpty
            ? _titleSvController.text
            : 'Standardtitel',
        'location_en': _locationEnController.text.isNotEmpty
            ? _locationEnController.text
            : 'Default Location',
        'location_fi': _locationFiController.text.isNotEmpty
            ? _locationFiController.text
            : 'Oletuspaikka',
        'location_sv': _locationSvController.text.isNotEmpty
            ? _locationSvController.text
            : 'Standardplats',
        'dateTime': _dateTimeController.text.isNotEmpty
            ? _dateTimeController.text
            : DateTime.now().toIso8601String(),
        'price':
            _priceController.text.isNotEmpty ? _priceController.text : 'Free',
        'organizerName': _organizerNameController.text.isNotEmpty
            ? _organizerNameController.text
            : 'Organizer Name',
        'details_en': _detailsEnController.text.isNotEmpty
            ? _detailsEnController.text
            : 'Default Details',
        'details_fi': _detailsFiController.text.isNotEmpty
            ? _detailsFiController.text
            : 'Oletustiedot',
        'details_sv': _detailsSvController.text.isNotEmpty
            ? _detailsSvController.text
            : 'Standardinformation',
        'ticketDetails_en': _ticketDetailsEnController.text.isNotEmpty
            ? _ticketDetailsEnController.text
            : 'Default Ticket Details',
        'ticketDetails_fi': _ticketDetailsFiController.text.isNotEmpty
            ? _ticketDetailsFiController.text
            : 'Oletuslipputiedot',
        'ticketDetails_sv': _ticketDetailsSvController.text.isNotEmpty
            ? _ticketDetailsSvController.text
            : 'Standardbiljettinformation',
        'locationUrl': _locationUrlController.text.isNotEmpty
            ? _locationUrlController.text
            : 'https://example.com',
      };

      // Make the request to create a new document
      final response = await appwriteService.makeRequest(
        'POST',
        'databases/communitydb/collections/events/documents',
        {
          'documentId': 'unique()', // Generate a unique ID for the document
          'data': data // Properly pass the data object
        },
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Event added successfully!')),
        );
        Navigator.of(context).pop();
      } else {
        print('Failed to add event: ${response.body}'); // Log the error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add event: ${response.body}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: _pickPosterPhoto,
                  child: const Text('Select Poster Photo'),
                ),
                if (_selectedPosterPhoto != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text('Selected Photo: ${_selectedPosterPhoto!.path}'),
                  ),
                TextFormField(
                  controller: _titleEnController,
                  decoration:
                      const InputDecoration(labelText: 'Title (English)'),
                ),
                TextFormField(
                  controller: _titleFiController,
                  decoration:
                      const InputDecoration(labelText: 'Title (Finnish)'),
                ),
                TextFormField(
                  controller: _titleSvController,
                  decoration:
                      const InputDecoration(labelText: 'Title (Swedish)'),
                ),
                TextFormField(
                  controller: _locationEnController,
                  decoration:
                      const InputDecoration(labelText: 'Location (English)'),
                ),
                TextFormField(
                  controller: _locationFiController,
                  decoration:
                      const InputDecoration(labelText: 'Location (Finnish)'),
                ),
                TextFormField(
                  controller: _locationSvController,
                  decoration:
                      const InputDecoration(labelText: 'Location (Swedish)'),
                ),
                TextFormField(
                  controller: _dateTimeController,
                  decoration: const InputDecoration(labelText: 'Date and Time'),
                  onTap: () async {
                    DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    setState(() {
                      _dateTimeController.text = dateTime!.toIso8601String();
                    });
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                ),
                TextFormField(
                  controller: _organizerNameController,
                  decoration:
                      const InputDecoration(labelText: 'Organizer Name'),
                ),
                TextFormField(
                  controller: _detailsEnController,
                  decoration:
                      const InputDecoration(labelText: 'Details (English)'),
                ),
                TextFormField(
                  controller: _detailsFiController,
                  decoration:
                      const InputDecoration(labelText: 'Details (Finnish)'),
                ),
                TextFormField(
                  controller: _detailsSvController,
                  decoration:
                      const InputDecoration(labelText: 'Details (Swedish)'),
                ),
                TextFormField(
                  controller: _ticketDetailsEnController,
                  decoration: const InputDecoration(
                      labelText: 'Ticket Details (English)'),
                ),
                TextFormField(
                  controller: _ticketDetailsFiController,
                  decoration: const InputDecoration(
                      labelText: 'Ticket Details (Finnish)'),
                ),
                TextFormField(
                  controller: _ticketDetailsSvController,
                  decoration: const InputDecoration(
                      labelText: 'Ticket Details (Swedish)'),
                ),
                TextFormField(
                  controller: _locationUrlController,
                  decoration: const InputDecoration(labelText: 'Location URL'),
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
