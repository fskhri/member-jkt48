import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/color.dart';

class CustomBottomSheet extends StatelessWidget {
  Widget buildButton(
      IconData icon, String text, VoidCallback onPressed, Color iconColor) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: AppColors.primary[200]!),
        primary: AppColors.neutral[0],
        onPrimary: AppColors.primary[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Container(
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 22.0,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary[400],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignUpButton(VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Sign up',
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.05,
        horizontal: 0.05 * MediaQuery.of(context).size.width,
      ),
      height: screenHeight * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading:
                Icon(FontAwesomeIcons.times, color: AppColors.primary[400]),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 0.02 * screenHeight),
          Text(
            'Log in to JKT48 PM',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 0.03 * screenHeight,
              fontWeight: FontWeight.bold,
              color: AppColors.primary[400],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 0.01 * screenHeight),
          Text(
            'Log in for exclusive and intimate access to your favorite idols! 🎤✨',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 0.014 * screenHeight,
              fontWeight: FontWeight.bold,
              color: AppColors.primary[200],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 0.02 * screenHeight),
          buildButton(FontAwesomeIcons.user, 'Use email / username', () {},
              AppColors.primary[400]!),
          SizedBox(height: 0.012 * screenHeight),
          buildButton(FontAwesomeIcons.facebook, 'Continue with Facebook',
              () {}, Color(0xFF3B5998)),
          SizedBox(height: 0.012 * screenHeight),
          buildButton(FontAwesomeIcons.apple, 'Continue with Apple', () {},
              Color(0xFF000000)),
          SizedBox(height: 0.012 * screenHeight),
          buildButton(FontAwesomeIcons.google, 'Continue with Google', () {},
              Color(0xFF4285F4)),
          SizedBox(height: 0.012 * screenHeight),
          buildButton(FontAwesomeIcons.line, 'Continue with Line', () {},
              Color(0xFF00B900)),
          SizedBox(height: 0.012 * screenHeight),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 0.016 * screenHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account? ',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 0.014 * screenHeight,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                buildSignUpButton(() {
                  // Add your sign-up button functionality here
                  print('Sign up button pressed');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
