//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor oToDark = MaterialColor(
    0xffd07746, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffbb6b3f), //10%
      100: Color(0xffa65f38), //20%
      200: Color(0xff925331), //30%
      300: Color(0xff7d472a), //40%
      400: Color(0xff683c23), //50%
      500: Color(0xff53301c), //60%
      600: Color(0xff3e2415), //70%
      700: Color(0xff2a180e), //80%
      800: Color(0xff150c07), //90%
      900: Color(0xff000000), //100%
    },
  );
}
