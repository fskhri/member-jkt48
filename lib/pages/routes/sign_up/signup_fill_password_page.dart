import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pm_member/utils/color.dart';
import 'package:pm_member/pages/routes/sign_up/signup_conf_password_page.dart';

class SignUpFillPasswordPage extends StatefulWidget {
  const SignUpFillPasswordPage({Key? key}) : super(key: key);

  @override
  State<SignUpFillPasswordPage> createState() => _SignUpFillPasswordPageState();
}

class _SignUpFillPasswordPageState extends State<SignUpFillPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isSignUpButtonEnabled = false;
  bool isObscure = true;

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
          key: _formKey,
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
                    onChanged: (_) {
                      setState(() {
                        isSignUpButtonEnabled =
                            passwordController.text.isNotEmpty;
                      });
                    },
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
                  _buildPasswordAlert(),
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

  // Build the password alert widget (removed validation logic)
  Widget _buildPasswordAlert() {
    return SizedBox.shrink();
  }

  // Build the Continue button widget
  Widget _buildSignUpButton(double screenWidth) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        onPressed: isSignUpButtonEnabled
            ? () {
                // Perform signup logic here
                if (_formKey.currentState?.validate() ?? false) {
                  // If validation passes, navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpConfPasswordPage(),
                    ),
                  );
                }
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

  // Build the password visibility toggle button widget
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
