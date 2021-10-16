import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_text_drawable/flutter_text_drawable.dart';
import 'package:flutter_text_drawable/src/avatar_drawable_widget.dart';

void main() {
  testWidgets("Text Drawable Widget Test", (WidgetTester tester) async {
    final String url =
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fde%2Fphotos%2Fmann-person-portr%25C3%25A4t-gesicht-388104%2F&psig=AOvVaw0Hxm_n1SGg6LbJwNTrWTTS&ust=1634479447178000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKCx7MmMz_MCFQAAAAAdAAAAABAD";
    // Build the TextDrawable widget from a MaterialApp root
    // To prevent text directionality exception
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AvatarDrawable(
            urlAvatar: url,
            isTappable: true,
            onLongPress: (bool selected) {},
            onTap: (bool selected) {},
          ),
        ),
      ),
    );

    // Expect to find the first character in the Text supplied but not an Icon
    // expect(find.text(text[0]), findsOneWidget);
    expect(find.byIcon(Icons.check), findsNothing);

    // Tap on the TextDrawable widget
    await tester.tap(find.byType(TextDrawable));

    // Wait for widget to be rebuilt
    await tester.pumpAndSettle();

    // Expect to find an Icon instead of a Text
    expect(find.byIcon(Icons.check), findsOneWidget);
    // expect(find.text(text[0]), findsNothing);
  });
}
