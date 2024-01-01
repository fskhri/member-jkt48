import 'package:flutter/material.dart';

class AppColors {
  // Primary color palette
  static const Map<int, Color> primary = {
    50: Color(0xffF2F2F2),
    100: Color(0xffD0D0D0),
    200: Color(0xff8A8A8A),
    300: Color(0xff3B3B3B),
    400: Color(0xff242424),
    500: Color(0xff000000),
    600: Color(0xff3B3B3B),
    700: Color(0xff111111),
    800: Color(0xffFAEEF2),
    900: Color(0xffFCC334),
    1000: Color(0xffDB1111),
  };

  // Neutral color palette
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

  // Success color palette
  static const Map<int, Color> success = {
    100: Color(0xffE8FFF2),
    200: Color(0xff5DBE89),
    300: Color(0xff38A569),
  };

  // Danger color palette
  static const Map<int, Color> danger = {
    100: Color(0xffFFF2F2),
    200: Color(0xffDB1111),
    300: Color(0xffEB4245),
  };

  // Warning color palette
  static const Map<int, Color> warning = {
    100: Color(0xffFBF2CB),
    200: Color(0xffFFD573),
    300: Color(0xffF8BC30),
  };

  // Pink color palette
  static const Map<int, Color> pink = {
    100: Color(0xFFFFBDD5),
    200: Color(0xFFFF90B8),
    300: Color(0xFFFFEBF2),
    400: Color(0xFFFF629B),
    500: Color(0xFFEC3175),
    600: Color(0xFFCA1F5D),
    700: Color(0xFFA81048),
    800: Color(0xFF860634),
    900: Color(0xFF640024),
    1000: Color(0xFF420018),
  };

  static const Map<int, LinearGradient> pinkGradient = {
    500: LinearGradient(
      colors: [Color(0xFFEA228C), Color(0xFFFF629B)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  };
}
