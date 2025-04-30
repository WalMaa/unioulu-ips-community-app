import 'package:community/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  bool isLoading = false; // Track loading state
  bool isDarkMode = false; // Track theme state

  void _sendMessage() async {
    final userMessage = _controller.text;
    if (userMessage.isNotEmpty) {
      setState(() {
        messages.add({"sender": "user", "message": userMessage});
        _controller.clear();
        isLoading = true; // Start loading
      });
      // Send the message to the local API
      final response = await _getChatbotResponse(userMessage);
      setState(() {
        messages.add({"sender": "bot", "message": response});
        isLoading = false; // Stop loading
      });
    }
  }

  Future<String> _getChatbotResponse(String message) async {
    final url = Uri.parse('http://127.0.0.1:5000/chat');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({"prompt": message}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['response'] == null || data['response'] == '') {
        return 'Empty response from model.';
      }
      return data['response'] ?? 'No response';
    } else {
      return "Sorry, I couldn't understand that.";
    }
  }

  void _sendPredefinedResponse(String predefinedMessage) {
    setState(() {
      messages.add({"sender": "user", "message": predefinedMessage});
    });
    _sendMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Chat with Bot",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (isLoading && index == messages.length) {
                  return Center(
                      child: CircularProgressIndicator()); // Loading indicator
                }

                final message = messages[index];
                bool isUser = message['sender'] == 'user';

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: isUser
                            ? Colors.blue
                            : Colors.grey[300], // Lighter grey for bot
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        message['message'] ?? "",
                        style: TextStyle(
                          color: isUser
                              ? Colors.white
                              : Colors.black87, // Lighter text color for bot
                          fontSize: 16,
                          fontWeight:
                              FontWeight.w400, // Slightly lighter font weight
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.grey[800]
                          : Colors.white, // Darker color for better contrast
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.white
                            : Colors
                                .blueAccent, // Border color change based on theme
                        width:
                            1.5, // Slightly thicker border for better visibility
                      ),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Ask a question...",
                        hintStyle: TextStyle(
                            color: isDarkMode
                                ? Colors.white70
                                : Colors.black54), // Adjust hint color
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          // Quick reply buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _sendPredefinedResponse("Hello"),
                  child: Text("Hello"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _sendPredefinedResponse("How are you?"),
                  child: Text("How are you?"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
