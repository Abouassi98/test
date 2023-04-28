import 'dart:math';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/presentation/providers/provider_utils.dart';


part 'color_provider.g.dart';



@riverpod
class RandomColor extends _$RandomColor {
  int red = 255, green = 255, blue = 255;

  /// return initial value of provider
  @override
  Color build() {
    return Color.fromRGBO(red, green, blue, 1); // equal to white
  }

  /// change color with random color
  void changeColor() {
    red = Random().nextInt(256);
    green = Random().nextInt(256);
    blue = Random().nextInt(256);
    state = Color.fromRGBO(red, green, blue, 1);
  }

  String getHexaColor() {
    return '#${state.value.toRadixString(16).padLeft(8, '0')}';
  }

  String getRGBColor() {
    return 'rgb($red, $green, $blue)';
  }
}
enum ColorConvertType { hexadecimal, rgb }
@riverpod
class ColorType extends _$ColorType  with NotifierUpdate{
  /// return initial value of provider
  @override
  ColorConvertType build() {
    return ColorConvertType.hexadecimal; // equal to white
  }
}
