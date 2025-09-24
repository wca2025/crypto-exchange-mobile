// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cx/main.dart';
import 'package:test/expect.dart';
import 'package:test/test.dart';

main() {

  
  // late Calculator calculator;

  setUp(() {
    // calculator = Calculator();
  });

// setUpAll(): Runs just once before any test is executed.
// setUp(): Invoked before every test in a group or test suite.
// tearDown(): Invoked after every test even if the test has failed.
// tearDownAll(): Executed after all the tests have been completed.


  group('add', () {
    test('The calculator returns 8 when adding 6 and 2', () {
      // expect(calculator.add(6, 2), 8);
    });

    group('square root', () {
      test('The calculator returns 5 when the input is 25', () async {
        // expect(await calculator.squareRootOf(25), 5);
      });
    });
  });




  testWidgets('MyWidget has a title and message', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));


     final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);



//     findsNothing
// Verifies that no widgets are found.
// findsWidgets
// Verifies that one or more widgets are found.
// findsNWidgets
// Verifies that a specific number of widgets are found.
// matchesGoldenFile
// Verifies that a widget’s rendering matches a particular bitmap image (“golden file” testing).




  });



  testWidgets('Add and remove a todo', (tester) async {
  // Build the widget
  await tester.pumpWidget(const TodoList());

  // Enter 'hi' into the TextField.
  await tester.enterText(find.byType(TextField), 'hi');
});




  testWidgets('Add and remove a todo', (tester) async {
    // Build the widget.
    await tester.pumpWidget(const TodoList());

    // Enter 'hi' into the TextField.
    await tester.enterText(find.byType(TextField), 'hi');

    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));

    // Rebuild the widget with the new item.
    await tester.pump();

    // Expect to find the item on screen.
    expect(find.text('hi'), findsOneWidget);

    // Swipe the item to dismiss it.
    await tester.drag(find.byType(Dismissible), const Offset(500, 0));

    // Build the widget until the dismiss animation ends.
    await tester.pumpAndSettle();

    // Ensure that the item is no longer on screen.
    expect(find.text('hi'), findsNothing);
  });



}
