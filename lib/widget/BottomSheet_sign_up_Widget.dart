import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color.dart';
import '../pages/routes/sign_up/signup_page.dart';

class BottomSheetSignUpWidget extends StatelessWidget {
  // Function to build a custom elevated button for sign-up options
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

  // Function to build a text button for the 'Log in' option
  Widget buildSignUpButton(VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Log in',
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }

  // Main build function for the BottomSheetSignUpWidget
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 55.0),
      height: screenHeight * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close button on the top right corner
          ListTile(
            leading:
                Icon(FontAwesomeIcons.times, color: AppColors.primary[400]),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 0.02 * screenHeight),

          // Title of the BottomSheet
          Text(
            'Sign Up for JKT48 PM',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 0.03 * screenHeight,
              fontWeight: FontWeight.bold,
              color: AppColors.primary[400],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 0.01 * screenHeight),

          // Subtitle of the BottomSheet
          Text(
            'Sign Up for exclusive and intimate access to your favorite idols! 🎤✨',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 0.014 * screenHeight,
              fontWeight: FontWeight.bold,
              color: AppColors.primary[200],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 0.02 * screenHeight),

          // Sign-up option buttons
          buildButton(FontAwesomeIcons.user, 'Register with email', () {
            // Navigate to the sign-up page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          }, AppColors.primary[400]!),
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

          // Spacer to push the following content to the bottom
          Spacer(),

          // 'Already have an account?' text and 'Log in' button
          Container(
            margin: EdgeInsets.only(bottom: 0.016 * screenHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 0.014 * screenHeight,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                buildSignUpButton(() {
                  // Add your log-in button functionality here
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
