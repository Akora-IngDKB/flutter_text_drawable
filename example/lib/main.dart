import 'package:flutter/material.dart';
import 'package:flutter_text_drawable/flutter_text_drawable.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Text Drawable Demo',
    theme: ThemeData(primaryColor: Colors.green),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Text Drawable Demo'),
      ),
      body: Column(
        children: [
          // Using TextDrawable alone
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                leading: TextDrawable(
                  text: "$index",
                  isTappable: true,
                ),
                title: Text("Standalone Item $index"),
              );
            },
          ),
          SizedBox(height: 50),
          // Using the TextDrawableListTile widget
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return TextDrawableListTile(
                drawableText: "$index",
                title: Text("TextDrawableListTile Item $index"),
                onTap: null,
              );
            },
          ),
        ],
      ),
    );
  }
}
