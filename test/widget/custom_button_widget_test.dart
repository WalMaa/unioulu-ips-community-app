

import 'package:community/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomButton has text', (WidgetTester tester) async {
    // Define the test key
    const testKey = Key('custom_button_key');

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            key: testKey,
            text: 'Test Button',
            onPressed: () {},
          ),
        ),
      ),
    );

    // Verify that the button is created with the correct title and icon
    expect(find.byKey(testKey), findsOneWidget);
    expect(find.text('Test Button'), findsOneWidget);
  });

  testWidgets('CustomButton calls onPressed when tapped', (WidgetTester tester) async {
    // Define the test key
    const testKey = Key('custom_button_key');
    bool wasPressed = false;

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            key: testKey,
            text: 'Test Button',
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.byKey(testKey), findsOneWidget);
    expect(find.text('Test Button'), findsOneWidget);

    // Tap the button
    await tester.tap(find.byKey(testKey));
    await tester.pumpAndSettle(); // Wait for animations to complete
    expect(wasPressed, true);
  });

  testWidgets('Custombutton has cahnged font size', (WidgetTester tester) async {
    // Define the test key
    const testKey = Key('custom_button_key');

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            key: testKey,
            text: 'Test Button',
            onPressed: () {},
            fontSize: 20.0,
          ),
        ),
      ),
    );

    // Verify that the button is created with the correct title and icon
    expect(find.byKey(testKey), findsOneWidget);
    expect(find.text('Test Button'), findsOneWidget);

    // Check if the font size is applied correctly
    final textFinder = find.text('Test Button');
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.style?.fontSize, 20.0);
  });
  
  testWidgets('CustomButton has changed padding', (WidgetTester tester) async {
    // Define the test key
    const testKey = Key('custom_button_key');

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            key: testKey,
            text: 'Test Button',
            onPressed: () {},
            padding: 30.0,
          ),
        ),
      ),
    );

    // Verify that the button is created with the correct title and icon
    expect(find.byKey(testKey), findsOneWidget);
    expect(find.text('Test Button'), findsOneWidget);

    // Check if the padding is applied correctly
    final buttonFinder = find.byKey(testKey);
    final buttonWidget = tester.widget<CustomButton>(buttonFinder);
    expect(buttonWidget.padding, 30.0);
  });
}