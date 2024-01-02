import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pm_member/utils/color.dart';
import 'signup_birthdate_page.dart';

class SignUpNickPage extends StatefulWidget {
  const SignUpNickPage({Key? key}) : super(key: key);

  @override
  State<SignUpNickPage> createState() => _SignUpNickPageState();
}

class _SignUpNickPageState extends State<SignUpNickPage> {
  TextEditingController nicknameController = TextEditingController();

  bool isContinueButtonEnabled = false;

  // Update the state of the continue button based on the text input
  void _updateContinueButtonState() {
    setState(() {
      isContinueButtonEnabled = nicknameController.text.isNotEmpty;
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
                  'What is your nickname?',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: constraints.maxWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                Text(
                  'Make sure that the information you provide aligns with your personal details.',
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
                      'Nickname ',
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
                  controller: nicknameController,
                  onChanged: (_) => _updateContinueButtonState(),
                  decoration: InputDecoration(
                    hintText: 'fill in here!',
                    hintStyle: GoogleFonts.plusJakartaSans(
                      fontSize: constraints.maxWidth * 0.035,
                      fontWeight: FontWeight.normal,
                    ),
                    suffixIcon: _buildClearButton(nicknameController),
                  ),
                  textAlign: TextAlign.left,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your nickname';
                    }
                    // Add additional validation if needed
                    return null;
                  },
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

  // Build the UI for the continue button
  Widget _buildContinueButton(double screenWidth) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        onPressed: isContinueButtonEnabled
            ? () {
                // Navigate to the birth date page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpBirthDatePage(),
                  ),
                );
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

  // Build the UI for the clear button next to the nickname input field
  Widget _buildClearButton(TextEditingController controller) {
    return IconButton(
      icon: Icon(Icons.clear_rounded),
      onPressed: () {
        controller.clear();
        _updateContinueButtonState();
      },
    );
  }
}
