import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Hello,', style: TextStyle(fontSize: 16.0)),
                          Text(
                            'Salman F',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                          Text(
                            'Let\'s explore the what\'s new...',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.settings),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Announcements',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Topics',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 150.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      // Example data for demonstration
                      final List<Map<String, dynamic>> topics = [
                        {'icon': Icons.group_work, 'text': 'Work'},
                        {'icon': Icons.sports, 'text': 'Sports'},
                        {'icon': Icons.book, 'text': 'Academy'},
                        {'icon': Icons.campaign, 'text': 'Party'},
                        {'icon': Icons.campaign, 'text': 'Some'},
                        {'icon': Icons.campaign, 'text': 'Another'},
                        {'icon': Icons.campaign, 'text': 'Party'},
                      ];
                      return Container(
                        width: 90.0,
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Icon(
                                topics[index]['icon'],
                                color: Colors.blue,
                                size: 40.0,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              topics[index]['text'],
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Latest Events',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 240.0, // Adjust the height to fit the content
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      final List<Map<String, dynamic>> events = [
                        {
                          'image':
                              'https://www.keyweo.com/wp-content/uploads/2022/04/google-logo-history.jpg',
                          'title': 'Volunteer Event in Oulu  jlkjlj lkjl!',
                          'location': 'Oulu, Finland',
                          'price': 'Free',
                        },
                        {
                          'image':
                              'https://www.keyweo.com/wp-content/uploads/2022/04/google-logo-history.jpg',
                          'title': 'Oulu Sports Extravaganza',
                          'location': 'University of Oulu',
                          'price': '€5',
                        },
                        // Add more events as needed
                      ];
                      final event = events[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to event details page
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsPage(event: event)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 250.0, // Adjust width as needed
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
                              padding: const EdgeInsets.all(
                                  8.0), // Padding inside the card
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Photo container
                                  Container(
                                    height:
                                        150.0, // Adjust the height as needed
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
                                            event['image'],
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
                                              padding:
                                                  const EdgeInsets.all(4.0),
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
                                              event['price'],
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
                                  // Event title
                                  Text(
                                    event['title'],
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5.0),
                                  // Event location
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
                                          event['location'],
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
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Community',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
