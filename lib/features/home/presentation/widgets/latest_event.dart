import 'package:flutter/material.dart';
import '../../../../core/services/http_appwrite_service.dart';

class LatestEventsWidget extends StatefulWidget {
  const LatestEventsWidget({super.key});

  @override
  LatestEventsWidgetState createState() => LatestEventsWidgetState();
}

class LatestEventsWidgetState extends State<LatestEventsWidget> {
  late AppwriteService _appwriteService;
  List<Map<String, dynamic>> _events = [];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _appwriteService = AppwriteService();
    _fetchLatestEvents();
  }

Future<void> _fetchLatestEvents() async {
  try {
    final response = await _appwriteService.listDocuments(
      collectionId: "events",
    );

    if (!mounted) return;

    final List<dynamic> jsonData = response['documents'];

    // Sort by date if available
    final sortedEvents = jsonData
      ..sort((a, b) =>
          DateTime.parse(b['date']).compareTo(DateTime.parse(a['date'])));

    // Limit to 3 latest events
    setState(() {
      _events = sortedEvents.take(3).toList().cast<Map<String, dynamic>>();
      _isLoading = false;
    });
  } catch (e) {
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _hasError = true;
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : _hasError
            ? const Center(child: Text('Failed to load events.'))
            : SizedBox(
                height: 240.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _events.length,
                  itemBuilder: (context, index) {
                    final event = _events[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to event details page
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: 250.0,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          event['posterPhotoUrl'],
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 8.0,
                                        right: 8.0,
                                        child: GestureDetector(
                                          onTap: () {
                                            // Handle favorite/bookmark toggle
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: const Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8.0,
                                        left: 8.0,
                                        child: Container(
                                          padding: const EdgeInsets.all(4.0),
                                          decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Text(
                                            event[
                                                'price'], // Assuming 'price' exists in API
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  event['title_en'],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Expanded(
                                      child: Text(
                                        event[
                                            'location_en'], // Assuming 'location' exists in API
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
  }
}
