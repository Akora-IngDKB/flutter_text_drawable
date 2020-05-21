import 'package:flutter/material.dart';
import 'package:flutter_text_drawable/flutter_text_drawable.dart';
import 'package:flutter_text_drawable/src/contrast_helper.dart';

class TextDrawable extends StatefulWidget {
  /// The text supplied. Only first character will be displayed.
  final String text;

  /// Height of the [TextDrawable] widget.
  final double height;

  /// Width of the [TextDrawable] widget.
  final double width;

  /// `TextStyle` for the `text` to be displayed.
  final TextStyle textStyle;

  /// Background color to for the widget.
  /// If not specified, a random color will be generated.
  final Color backgroundColor;

  /// Shape of the widget.
  /// Defaults to `BoxShape.circle`.
  final BoxShape boxShape;

  /// Border radius of the widget.
  /// Only specify this if `boxShape == BoxShape.circle`.
  final BorderRadiusGeometry borderRadius;

  /// Specify duration of animation between text and checked icon.
  /// Defaults to current theme animation duration.
  final Duration duration;

  /// Set to `true` when you want the widget to recognize taps.
  /// Typical selection behaviour found in the Gmail app.
  final bool isTappable;

  /// Callback received when widget is tapped.
  /// It emits its current selected status.
  final Function(bool) onTap;

  /// Creates a customizable [TextDrawable] widget.
  TextDrawable({
    Key key,
    @required this.text,
    this.height = 48,
    this.width = 48,
    this.textStyle,
    this.backgroundColor,
    this.boxShape = BoxShape.circle,
    this.borderRadius,
    this.duration = kThemeAnimationDuration,
    this.isTappable = false,
    this.onTap,
  }) : super(key: key) {
    assert(
      boxShape == BoxShape.rectangle || borderRadius == null,
      "Set boxShape = BoxShape.rectangle when borderRadius is specified",
    );
    assert(
      onTap == null || isTappable,
      "isTappable must be true to receive onTapped callback",
    );
  }

  @override
  _TextDrawableState createState() => _TextDrawableState();
}

class _TextDrawableState extends State<TextDrawable> {
  bool isSelected = false;
  Color backgroundColor;

  @override
  void initState() {
    backgroundColor = widget.backgroundColor ??
        ColorGenerator().getRandomColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double contrast = ContrastHelper.contrast([
      backgroundColor.red,
      backgroundColor.green,
      backgroundColor.blue,
    ], [
      255,
      255,
      255
    ] /** white text */);

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });

        if (widget.isTappable && widget.onTap != null) widget.onTap(isSelected);
      },
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: widget.boxShape,
          borderRadius: widget.borderRadius,
        ),
        child: AnimatedSwitcher(
          duration: widget.duration,
          transitionBuilder: (child, animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: (widget.isTappable && isSelected)
              ? Icon(
                  Icons.check,
                  color: contrast > 1.8 ? Colors.white : Colors.black,
                )
              : Text(
                  widget.text[0].toUpperCase(),
                  style: widget.textStyle?.copyWith(
                        color: contrast > 1.8 ? Colors.white : Colors.black,
                      ) ??
                      TextStyle(
                        fontSize: 18,
                        color: contrast > 1.8 ? Colors.white : Colors.black,
                      ),
                ),
        ),
      ),
    );
  }
}
