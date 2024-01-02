import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pm_member/common/color.dart';
import 'package:pm_member/pages/routes/sign_up/signup_nickname_page.dart';

class SignUpConfPasswordPage extends StatefulWidget {
  const SignUpConfPasswordPage({Key? key}) : super(key: key);

  @override
  State<SignUpConfPasswordPage> createState() => _SignUpConfPasswordPageState();
}

class _SignUpConfPasswordPageState extends State<SignUpConfPasswordPage> {
  TextEditingController confirmPasswordController = TextEditingController();

  bool isContinueButtonEnabled = false;
  bool isPasswordHidden = true;

  // Update the state of the Continue button based on text input
  void _updateContinueButtonState() {
    setState(() {
      isContinueButtonEnabled = confirmPasswordController.text.isNotEmpty;
    });
  }

  // Navigate to the nickname page when the Continue button is pressed
  void _navigateToNickPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpNickPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Image.asset(
              'assets/images/minilogo.png',
              width: 40.0,
              height: 40.0,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 55.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: constraints.maxHeight * 0.05),
                Text(
                  'Confirm your password',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: constraints.maxWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                Text(
                  'Are you sure about the password you\'ve chosen? Please re-enter it to confirm!',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: constraints.maxWidth * 0.035,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                _buildPasswordField(constraints),
                SizedBox(height: constraints.maxHeight * 0.01),
                TextFormField(
                  controller: confirmPasswordController,
                  onChanged: (_) => _updateContinueButtonState(),
                  obscureText: isPasswordHidden,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: GoogleFonts.plusJakartaSans(
                      fontSize: constraints.maxWidth * 0.035,
                      fontWeight: FontWeight.normal,
                    ),
                    suffixIcon: _buildTogglePasswordVisibilityButton(),
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                _buildContinueButton(constraints.maxWidth),
              ],
            );
          },
        ),
      ),
    );
  }

  // Build the password field widget with label and asterisk
  Widget _buildPasswordField(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Password ',
              textAlign: TextAlign.right,
              style: GoogleFonts.plusJakartaSans(
                fontSize: constraints.maxWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: AppColors.primary[300],
              ),
            ),
            Text(
              '*',
              style: TextStyle(
                fontSize: constraints.maxWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Build the Continue button widget
  Widget _buildContinueButton(double screenWidth) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        onPressed: isContinueButtonEnabled
            ? () {
                _navigateToNickPage();
              }
            : null,
        style: ElevatedButton.styleFrom(
          primary: isContinueButtonEnabled ? AppColors.pink[500] : Colors.grey,
          onPrimary: AppColors.neutral[0],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          fixedSize: Size(screenWidth * 0.8, 44),
        ),
        child: Text('Continue'),
      ),
    );
  }

  // Build the password visibility toggle button widget
  Widget _buildTogglePasswordVisibilityButton() {
    return IconButton(
      icon: Icon(
        isPasswordHidden ? Icons.visibility : Icons.visibility_off,
        color: Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isPasswordHidden = !isPasswordHidden;
        });
      },
    );
  }
}
