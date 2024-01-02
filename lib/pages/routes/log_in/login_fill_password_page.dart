import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pm_member/utils/color.dart';
import '../../homepage.dart';

class LoginFillPasswordPage extends StatefulWidget {
  const LoginFillPasswordPage({Key? key}) : super(key: key);

  @override
  State<LoginFillPasswordPage> createState() =>
      _LoginFillPasswordPageState();
}

class _LoginFillPasswordPageState extends State<LoginFillPasswordPage> {
  TextEditingController passwordController = TextEditingController();

  bool isSignUpButtonEnabled = false;
  bool isObscure = true;

  // Update the state of the "Continue" button based on password input
  void _updateSignUpButtonState() {
    setState(() {
      isSignUpButtonEnabled = passwordController.text.isNotEmpty;
    });
  }

  // Navigate to the homepage
  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
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
                  'Fill your password',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: constraints.maxWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                Text(
                  'Remember to enter your password correctly and accurately.',
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
                  controller: passwordController,
                  onChanged: (_) => _updateSignUpButtonState(),
                  obscureText: isObscure,
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
                _buildSignUpButton(constraints.maxWidth),
              ],
            );
          },
        ),
      ),
    );
  }

  // Build the password field label
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

  // Build the "Continue" button
  Widget _buildSignUpButton(double screenWidth) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        onPressed: isSignUpButtonEnabled
            ? () {
                // Perform login logic here

                // If login is successful, navigate to the homepage
                _navigateToHomePage();
              }
            : null,
        style: ElevatedButton.styleFrom(
          primary: isSignUpButtonEnabled ? AppColors.pink[500] : Colors.grey,
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

  // Build the toggle password visibility button
  Widget _buildTogglePasswordVisibilityButton() {
    return IconButton(
      icon: Icon(
        isObscure ? Icons.visibility : Icons.visibility_off,
        color: Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isObscure = !isObscure;
        });
      },
    );
  }
}
