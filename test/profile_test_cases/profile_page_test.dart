import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';

import 'package:community/features/profile/presentation/pages/profile_page.dart';
import 'package:community/features/more/presentation/bloc/more_bloc.dart';
import './mocks.mocks.dart'; // Adjust this path if your mocks.dart is somewhere else

void main() {
  late MockMoreBloc mockMoreBloc;

  setUp(() {
    mockMoreBloc = MockMoreBloc();

    // Mock the stream to return a stream of states, starting with the initial state.
    when(mockMoreBloc.stream).thenAnswer((_) => Stream.value(MoreInitial()));

    // Mock the state to return MoreInitial when accessed directly.
    when(mockMoreBloc.state).thenReturn(MoreInitial());  // Replace with your actual initial state
  });

  testWidgets('User can see the information of application from about tab', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<MoreBloc>.value(
          value: mockMoreBloc,
          child: ProfilePage(),
        ),
      ),
    );

    // Ensure the profile page is fully loaded
    await tester.pumpAndSettle(); // Wait for the profile page to render

    // Tap About button
    final aboutFinder = find.text('About');
    expect(aboutFinder, findsOneWidget);
    await tester.tap(aboutFinder);
    await tester.pumpAndSettle(); // Wait for the dialog to appear

    // Tap OK button to close the dialog
    final okButtonFinder = find.text('OK');
    expect(okButtonFinder, findsOneWidget); // Ensure the "OK" button is found
    await tester.tap(okButtonFinder);
    await tester.pumpAndSettle(); // Wait for the dialog to close
  });

  // testWidgets('User can open Help dialog', (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider<MoreBloc>.value(
  //         value: mockMoreBloc,
  //         child: ProfilePage(),
  //       ),
  //     ),
  //   );

  //   // Ensure the profile page is fully loaded
  //   await tester.pumpAndSettle(); // Wait for the profile page to render

  //   // Tap Help button
  //   final helpFinder = find.text('Help');
  //   expect(helpFinder, findsOneWidget);
  //   await tester.tap(helpFinder);
  //   await tester.pumpAndSettle(); // Wait for the dialog to appear

  //   // Tap OK button to close the dialog
  //   final okButtonFinder = find.text('OK');
  //   expect(okButtonFinder, findsOneWidget); // Ensure the "OK" button is found
  //   await tester.tap(okButtonFinder);
  //   await tester.pumpAndSettle(); // Wait for the dialog to close
  // });

  //   testWidgets('User can report an issue', (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider<MoreBloc>.value(
  //         value: mockMoreBloc,
  //         child: ProfilePage(),
  //       ),
  //     ),
  //   );

  //   // Ensure the profile page is fully loaded
  //   await tester.pumpAndSettle(); // Wait for the profile page to render

  //   // Tap 'Report an Issue' button
  //   final reportAnIssue = find.text('Report an Issue');
  //   expect(reportAnIssue, findsOneWidget); // Ensure the button is found
  //   await tester.tap(reportAnIssue);
  //   await tester.pumpAndSettle(); // Wait for the dialog to appear

  //   // Verify the Report Issue dialog content
  //   expect(find.text('Email us at bugs@communityapp.com or visit our support center.'), findsOneWidget);

  //   // Tap OK button to close the dialog
  //   final okButtonFinder = find.text('OK');
  //   expect(okButtonFinder, findsOneWidget); // Ensure the "OK" button is found
  //   await tester.tap(okButtonFinder);
  //   await tester.pumpAndSettle(); // Wait for the dialog to close
  // });

  // test case for changing the theme

  testWidgets('Tapping Dark Mode switch changes theme to dark', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<MoreBloc>.value(
          value: mockMoreBloc,
          child: ProfilePage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final switchFinder = find.byType(SwitchListTile);
    expect(switchFinder, findsOneWidget);

    await tester.ensureVisible(switchFinder);
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    // Now verify the theme changed by checking a widget's color
    final profileText = find.text('Profile Management'); // Default English string
    final textWidget = tester.widget<Text>(profileText);
    expect(textWidget.style?.color, Colors.white); // Dark mode uses white text
  });

  // test case for report an issue
  // testWidgets('User can report an issue', (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider<MoreBloc>.value(
  //         value: mockMoreBloc,
  //         child: ProfilePage(),
  //       ),
  //     ),
  //   );

  //   // Ensure the profile page is fully loaded
  //   await tester.pumpAndSettle(); // Wait for the profile page to render

  //   // Tap 'Report an Issue' button directly by widget type (e.g., FlatButton, TextButton)
  //   final reportAnIssueButton = find.byType(ElevatedButton); // Or replace with the correct button type
  //   expect(reportAnIssueButton, findsOneWidget); // Ensure the button is found
    
  //   // Ensure button is visible before tapping
  //   await tester.ensureVisible(reportAnIssueButton);
  //   await tester.tap(reportAnIssueButton);
  //   await tester.pumpAndSettle(); // Wait for the dialog to appear

  //   // Verify the Report Issue dialog content
  //   expect(find.text('Email us at bugs@communityapp.com or visit our support center.'), findsOneWidget);

  //   // Tap OK button to close the dialog
  //   final okButtonFinder = find.text('OK');
  //   expect(okButtonFinder, findsOneWidget); // Ensure the "OK" button is found
  //   await tester.tap(okButtonFinder);
  //   await tester.pumpAndSettle(); // Wait for the dialog to close
  // });

  testWidgets('User can change password with current and new password', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider<MoreBloc>.value(
        value: mockMoreBloc,
        child: ProfilePage(),
      ),
    ),
  );

  await tester.pumpAndSettle(); // Wait for the profile page to render

  // Tap the "Change Password" ListTile
  final listTileFinder = find.widgetWithText(ListTile, 'Change Password');
  expect(listTileFinder, findsOneWidget);
  await tester.tap(listTileFinder);
  await tester.pumpAndSettle(); // Wait for dialog

  // Find and fill in the password fields
  final textFields = find.byType(TextField);
  expect(textFields, findsNWidgets(5)); // You might adjust this depending on total TextFields
  await tester.enterText(textFields.at(3), 'Khghaffa123!'); // Current password
  await tester.enterText(textFields.at(4), 'NewPassword123!'); // New password

  // Now find the dialog's "Change Password" button
  final dialogChangeButton = find.descendant(
    of: find.byType(AlertDialog),
    matching: find.widgetWithText(ElevatedButton, 'Change Password'),
  );

  expect(dialogChangeButton, findsOneWidget);
  await tester.tap(dialogChangeButton);
  await tester.pumpAndSettle();

  // Check for success message
  //expect(find.text('Password changed successfully!'), findsOneWidget);
});

// testWidgets('User can view and dismiss Help dialog', (WidgetTester tester) async {
//   // Build the widget with the appropriate bloc
//   await tester.pumpWidget(
//     MaterialApp(
//       home: BlocProvider<MoreBloc>.value(
//         value: mockMoreBloc,
//         child: ProfilePage(),
//       ),
//     ),
//   );

//   // Wait for UI to render
//   await tester.pumpAndSettle();

//   // Find the Help ListTile by text
//   final helpTileFinder = find.byKey(Key('help_tile'));
//   expect(helpTileFinder, findsOneWidget);

//   // Tap the Help tile
//   await tester.tap(helpTileFinder);
//   await tester.pumpAndSettle(); // Wait for the dialog to open

//   // Check if dialog with correct title and content is shown
//   expect(find.text('Help'), findsOneWidget);

//   // Tap the OK button to dismiss
//   final okButton = find.widgetWithText(TextButton, 'OK');
//   expect(okButton, findsOneWidget);

//   await tester.tap(okButton);
//   await tester.pumpAndSettle(); // Wait for the dialog to close

//   // Ensure dialog is dismissed
//   expect(find.text('Help'), findsNothing);
// });


}
