import 'package:flutter/material.dart';
import 'package:flutter_text_drawable/flutter_text_drawable.dart';
import 'package:flutter_text_drawable/src/contrast_helper.dart';

class TextDrawable extends StatefulWidget {
  /// The text supplied. Only first character will be displayed
  final String text;

  /// Height of the [TextDrawable] widget
  final double height;

  /// Width of the [TextDrawable] widget
  final double width;

  /// `TextStyle` for the `text` to be displayed
  final TextStyle textStyle;

  /// Generates random colors
  final ColorGenerator colorGenerator;

  /// Shape of the widget.
  /// Defaults to `BoxShape.circle`
  final BoxShape boxShape;

  /// Border radius of the widget
  /// Do not specify this if `boxShape == BoxShape.circle`.
  final BorderRadiusGeometry borderRadius;

  /// Creates a customizable [TextDrawable] widget.
  TextDrawable({
    Key key,
    @required this.text,
    this.colorGenerator,
    this.height = 48,
    this.width = 48,
    this.textStyle,
    this.boxShape = BoxShape.circle,
    this.borderRadius,
  }) : super(key: key) {
    assert(boxShape == BoxShape.circle && borderRadius == null);
  }

  @override
  _TextDrawableState createState() => _TextDrawableState();
}

class _TextDrawableState extends State<TextDrawable> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.colorGenerator?.getRandomColor() ??
        ColorGenerator().getRandomColor();

    double contrast = ContrastHelper.contrast([
      backgroundColor.red,
      backgroundColor.green,
      backgroundColor.blue,
    ], [
      255,
      255,
      255
    ] /** white text */);

    return Container(
      alignment: Alignment.center,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: widget.boxShape,
        borderRadius: widget.borderRadius,
      ),
      child: Text(
        widget.text[0].toUpperCase(),
        style: widget.textStyle?.copyWith(
              color: contrast > 1.8 ? Colors.white : Colors.black,
            ) ??
            TextStyle(
              color: contrast > 1.8 ? Colors.white : Colors.black,
            ),
      ),
    );
  }
}
