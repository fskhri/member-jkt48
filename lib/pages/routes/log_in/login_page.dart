import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pm_member/pages/routes/log_in/login_fill_password_page.dart';
import 'package:pm_member/utils/color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Add a GlobalKey for the Form

  TextEditingController emailController = TextEditingController();

  bool isSignUpButtonEnabled = false;

  // Update the state of the signup button based on the text input
  void _updateSignUpButtonState() {
    setState(() {
      isSignUpButtonEnabled = emailController.text.isNotEmpty;
    });
  }

  // Build the UI for the signup button
  Widget _buildSignUpButton(double screenWidth) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        onPressed: () {
          // Validate the form before navigating to the next page
          if (_formKey.currentState?.validate() == true) {
            // Navigate to the fill password page when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginFillPasswordPage(),
              ),
            );
          }
        },
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

  // Build the UI for the clear button next to the email input field
  Widget _buildClearButton(TextEditingController controller) {
    return IconButton(
      icon: Icon(Icons.clear_rounded),
      onPressed: () {
        controller.clear();
        _updateSignUpButtonState();
      },
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
        child: Form(
          key: _formKey, // Assign the key to the Form widget
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
                    'Enter an active email address for verification and make your account more personal!.',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Use a regular expression for basic email validation
                      String emailPattern =
                          r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
                      RegExp regex = RegExp(emailPattern);
                      if (!regex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null; // Return null if the input is valid
                    },
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  _buildSignUpButton(constraints.maxWidth),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
