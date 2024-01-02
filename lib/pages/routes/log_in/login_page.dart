import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pm_member/utils/color.dart';
import 'login_fill_password_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();

  bool isSignUpButtonEnabled = false;

  // Update the state of the "Continue" button based on email input
  void _updateSignUpButtonState() {
    setState(() {
      isSignUpButtonEnabled = emailController.text.isNotEmpty;
    });
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
                  'Enter your email address',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: constraints.maxWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                Text(
                  'You can log in or make an account if you’re new to JKT48 PM.',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: constraints.maxWidth * 0.035,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Row(
                  children: [
                    Text(
                      'Email ',
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
                SizedBox(height: constraints.maxHeight * 0.01),
                TextFormField(
                  controller: emailController,
                  onChanged: (_) => _updateSignUpButtonState(),
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: GoogleFonts.plusJakartaSans(
                      fontSize: constraints.maxWidth * 0.035,
                      fontWeight: FontWeight.normal,
                    ),
                    suffixIcon: _buildClearButton(emailController),
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

  // Build the "Continue" button
  Widget _buildSignUpButton(double screenWidth) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        onPressed: isSignUpButtonEnabled
            ? () {
                // Navigate to the fill password page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginFillPasswordPage(),
                  ),
                );
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

  // Build the clear button to clear the email input
  Widget _buildClearButton(TextEditingController controller) {
    return IconButton(
      icon: Icon(Icons.clear_rounded),
      onPressed: () {
        controller.clear();
        _updateSignUpButtonState();
      },
    );
  }
}
