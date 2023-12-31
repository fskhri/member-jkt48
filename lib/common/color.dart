import 'package:flutter/material.dart';

class AppColors {
  static const Map<int, Color> primary = {
    50: Color(0xffE6F1FF),
    100: Color(0xffB0D5FE),
    200: Color(0xff8AC0FD),
    300: Color(0xff55A4FC),
    400: Color(0xff3492FC),
    500: Color(0xff0177FB),
    600: Color(0xff999999),
    700: Color(0xf111111f),
    800: Color(0xf01418Af),
    900: Color(0xff003269),
  };
  static const Map<int, Color> neutral = {
    0: Colors.white,
    100: Color(0xffF6F6F6),
    200: Color(0xffE3E3E3),
    300: Color(0xffD5D5D5),
    400: Color(0xffC2C2C2),
    500: Color(0xffB6B6B6),
    600: Color(0xffA4A4A4),
    700: Color(0xff959595),
    800: Color(0xff5A5A5A),
    900: Color(0xff202020),
  };
  static const Map<int, Color> success = {
    100: Color(0xffE8FFF2),
    200: Color(0xff5DBE89),
    300: Color(0xff38A569),
  };
  static const Map<int, Color> danger = {
    100: Color(0xffFFF2F2),
    200: Color(0xffEB4245),
    300: Color(0xffDB1F22),
  };
  static const Map<int, Color> warning = {
    100: Color(0xffFBF2CB),
    200: Color(0xffFFD573),
    300: Color(0xffF8BC30),
  };
}

/*
  how to use this widget :

  Container(
    color: AppColors.primary[500],
  )

*/
