import 'package:flutter/material.dart';

import 'package:flutter_text_drawable/flutter_text_drawable.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Text Drawable Demo',
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
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            leading: TextDrawable(
              text: "$index",
            ),
            title: Text("Item $index"),
          );
        },
      ),
    );
  }
}
