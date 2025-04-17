

import 'package:community/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('CustomTextField has text and icon', (WidgetTester tester) async {
    // Define the test key
    const testKey = Key('custom_text_field_key');
    const icon = Icons.text_fields;
    TextEditingController controller = TextEditingController();

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            key: testKey,
            hintText: 'Test TextField',
            prefixIcon: icon, controller: controller,
          ),
        ),
      ),
    );

    // Verify that the TextField is created with the correct title and icon
    expect(find.byKey(testKey), findsOneWidget);
    expect(find.text('Test TextField'), findsOneWidget);
    expect(find.byIcon(icon), findsOneWidget);
  });

  testWidgets('CustomTextField obscures text', (WidgetTester tester) async {
    // Define the test key
    const testKey = Key('custom_text_field_key');
    const icon = Icons.text_fields;
    TextEditingController controller = TextEditingController();

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            key: testKey,
            hintText: 'Test TextField',
            prefixIcon: icon, controller: controller,
            obscureText: true,
          ),
        ),
      ),
    );

    // Verify that the TextField is created with the correct title and icon
    expect(find.byKey(testKey), findsOneWidget);
    expect(find.text('Test TextField'), findsOneWidget);
    expect(find.byIcon(icon), findsOneWidget);
    expect(tester.widget<CustomTextField>(find.byKey(testKey)).obscureText, true);

  });
}