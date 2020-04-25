import 'package:flutter/material.dart';
import 'package:flutter_text_drawable/src/color_generator.dart';
import 'package:test/test.dart';

void main() {
  test("Color Generator Test", () {
    final ColorGenerator gen = ColorGenerator();

    Color color = gen.getRandomColor();

    expect(color, isNot(gen.getRandomColor()));
  });
}
