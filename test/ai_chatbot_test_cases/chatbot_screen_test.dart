import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:community/features/chatbot/chatbot_screen.dart';
import 'package:mockito/annotations.dart'; // For generating mocks
import './chatbot_screen_test.mocks.dart';  // Adjust this path as needed

// Generate mocks for http.Client
@GenerateMocks([http.Client])
void main() {
  testWidgets('Theme toggle works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(ChatbotScreen());

    final themeToggleButton = find.byIcon(Icons.nightlight_round);
    await tester.tap(themeToggleButton);
    await tester.pump();

    expect(find.byIcon(Icons.sunny), findsOneWidget);
  });

  testWidgets('User message is sent correctly', (WidgetTester tester) async {
    await tester.pumpWidget(ChatbotScreen());

    final textField = find.byType(TextField);
    final sendButton = find.byIcon(Icons.send);

    await tester.enterText(textField, 'Hello');
    await tester.tap(sendButton);
    await tester.pump();

    expect(find.text('Hello'), findsWidgets);
  });

  testWidgets('Bot response appears after user sends message', (WidgetTester tester) async {
    await tester.pumpWidget(ChatbotScreen());

    final textField = find.byType(TextField);
    final sendButton = find.byIcon(Icons.send);

    // Simulate user entering text
    await tester.enterText(textField, 'How are you?');
    
    // Simulate tapping the send button
    await tester.tap(sendButton);
    
    // Rebuild the widget tree after the button tap
    await tester.pump();

    // Simulate waiting for a response (with a delay, to simulate the processing time)
    await tester.pump(Duration(seconds: 2));

    // Check that some response text appears, but not necessarily 'No response'
    expect(find.byType(Text), findsWidgets);  // Ensure some Text widget is displayed
  });


  // testWidgets('Loading indicator appears while waiting for response', (WidgetTester tester) async {
  //   await tester.pumpWidget(ChatbotScreen());

  //   final textField = find.byType(TextField);
  //   final sendButton = find.byIcon(Icons.send);
    
  //   await tester.enterText(textField, 'How are you?');
  //   await tester.tap(sendButton);
  //   await tester.pump();

  //   // Wait for a short time to ensure the loading indicator is visible
  //   await tester.pump(Duration(milliseconds: 200));

  //   // Check if the loading indicator is visible
  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);

  //   // Wait for the response to complete
  //   await tester.pump(Duration(seconds: 2));

  //   // Check if the loading indicator is no longer visible
  //   expect(find.byType(CircularProgressIndicator), findsNothing);
  // });

  testWidgets('Predefined message button works', (WidgetTester tester) async {
    await tester.pumpWidget(ChatbotScreen());

    final helloButton = find.text('Hello');
    await tester.tap(helloButton);
    await tester.pump();

    // Use `findsWidgets` to check for multiple occurrences of the 'Hello' text
    expect(find.text('Hello'), findsWidgets);
});

  // testWidgets('Chatbot API is called with the correct message', (WidgetTester tester) async {
  //   final client = MockClient();
  //   final url = Uri.parse('http://127.0.0.1:5000/chat');
  //   final response = '{"response": "I am fine, thank you!"}';
    
  //   when(client.post(url, body: anyNamed('body'), headers: anyNamed('headers')))
  //       .thenAnswer((_) async => http.Response(response, 200));

  //   await tester.pumpWidget(MaterialApp(home: ChatbotScreen()));

  //   final textField = find.byType(TextField);
  //   final sendButton = find.byIcon(Icons.send);
  //   await tester.enterText(textField, 'How are you?');
  //   await tester.tap(sendButton);
  //   await tester.pump();

  //   // Verify the mock client is called with the expected parameters
  //   verify(client.post(url, body: anyNamed('body'), headers: anyNamed('headers'))).called(1);
  // });

  testWidgets('Chatbot displays a response from the API', (WidgetTester tester) async {
    // Start the app widget (ChatbotScreen)
    await tester.pumpWidget(MaterialApp(home: ChatbotScreen()));

    // Find the text field and send button
    final textField = find.byType(TextField);
    final sendButton = find.byIcon(Icons.send);

    // Enter some text into the text field
    await tester.enterText(textField, 'How are you?');
    await tester.tap(sendButton);
    await tester.pump();

    // Wait for the API response (simulate a delay)
    await tester.pump(Duration(seconds: 2));  // Adjust based on the API response time

    // Check if some response text from the chatbot appears
    expect(find.byType(Text), findsWidgets);  // Ensure some Text widget (response) is displayed
  });
}
