import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pm_member/utils/color.dart';
import '../../homepage.dart';

class SignUpBirthDatePage extends StatefulWidget {
  const SignUpBirthDatePage({Key? key}) : super(key: key);

  @override
  State<SignUpBirthDatePage> createState() => _SignUpBirthDatePageState();
}

class _SignUpBirthDatePageState extends State<SignUpBirthDatePage> {
  TextEditingController birthDateController = TextEditingController();
  DateTime? selectedDate;
  bool isSignUpButtonEnabled = false;

  // Update the state of the SignUp button based on text input or selected date
  void _updateSignUpButtonState() {
    setState(() {
      isSignUpButtonEnabled =
          birthDateController.text.isNotEmpty || selectedDate != null;
    });
  }

  // Show date picker and update state with the selected date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthDateController.text =
            DateFormat('dd-MM-yyyy').format(selectedDate!);
        _updateSignUpButtonState();
      });
    }
  }

  // Validate the birth date input
  String? _validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Birth date is required';
    }

    // Additional validation can be done here as needed
    // Example: Ensure that the birth date does not exceed the current date
    DateTime currentDate = DateTime.now();
    DateTime selectedDate = DateFormat('dd-MM-yyyy').parse(value);

    if (selectedDate.isAfter(currentDate)) {
      return 'Invalid birth date';
    }

    return null;
  }

  // Build the SignUp button widget
  Widget _buildSignUpButton(double screenWidth) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        onPressed: isSignUpButtonEnabled
            ? () {
                // Navigate to the homepage when the button is pressed
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HomePage(), // Replace with the actual name of your homepage class
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

  // Build the calendar icon button widget
  Widget _buildCalendarIcon() {
    return IconButton(
      icon: Icon(Icons.calendar_today),
      onPressed: () => _selectDate(context),
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
                  'When is your birth date?',
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
                TextFormField(
                  controller: birthDateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    hintText: 'Select or type your birth date',
                    hintStyle: GoogleFonts.plusJakartaSans(
                      fontSize: constraints.maxWidth * 0.035,
                      fontWeight: FontWeight.normal,
                    ),
                    suffixIcon: _buildCalendarIcon(),
                  ),
                  validator: _validateBirthDate,
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
}
