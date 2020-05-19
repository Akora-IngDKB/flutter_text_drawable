# flutter_text_drawable
![Github Language](https://img.shields.io/github/languages/top/Akora-IngDKB/show_hide_fab)
[![License](https://img.shields.io/badge/license-MIT-purple.svg)](LICENSE)
![Tests](https://github.com/Akora-IngDKB/flutter_text_drawable/workflows/Tests/badge.svg)

A flutter library that gives you the flexibility to create and customize text user avatars like Gmail and Contacts.

<p align="center">  
<img src="https://raw.githubusercontent.com/Akora-IngDKB/flutter_text_drawable/master/assets/shot1.png" height=500em><br />  
</p>

## Basic Usage
Simply add the ```TextDrawable``` to your widget tree like so:
```dart
TextDrawable(
    text: "Name",
)
```

## Example
```dart
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
```

## License
This project has been licensed under the MIT License. Check the [LICENSE](LICENSE) file for the details.