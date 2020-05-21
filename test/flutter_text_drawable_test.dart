import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_text_drawable/flutter_text_drawable.dart';

void main() {
  testWidgets("Text Drawable Widget Test", (WidgetTester tester) async {
    final String text = "Test";
    // Build the TextDrawable widget from a MaterialApp root
    // To prevent text directionality exception
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextDrawable(text: text),
        ),
      ),
    );

    // Expect to find the first character in the text supplied
    expect(find.text(text[0]), findsOneWidget);
  });
}
