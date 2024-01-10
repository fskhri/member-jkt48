import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/color.dart';
import '../../widgets/BottomSheet_log_in_Widget.dart';
import '../../widgets/BottomSheet_sign_up_Widget.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double screenHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 55.0),
        child: _buildContent(),
      ),
    );
  }

  // Build the main content of the loading page
  Widget _buildContent() {
    double screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _centerLogo(),
                    SizedBox(height: screenHeight * 0.02),
                    _buildHeaderText(screenWidth),
                    SizedBox(height: 36),
                    _buildLoginButton(screenWidth),
                    SizedBox(height: 12),
                    _buildSignUpButton(screenWidth),
                    SizedBox(height: 12),
                    _buildTermsAndPrivacyText(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Build the header with the logo and language button
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        _buildLanguageButton(),
      ],
    );
  }

  // Build the JKT48 logo
  Widget _buildLogo() {
    return Image.asset(
      'assets/images/minilogo.png',
      height: 100,
      width: 100,
    );
  }

  // Build the central logo
  Widget _centerLogo() {
    return Image.asset(
      'assets/images/logoload.png',
      height: 163,
      width: 311,
    );
  }

  // Build the language selection button
  Widget _buildLanguageButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.neutral[0],
        onPrimary: AppColors.pink[500],
        side: BorderSide(color: AppColors.primary[200]!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/language.svg',
            color: AppColors.primary[200],
            height: 20,
            width: 20,
          ),
          SizedBox(width: 5),
          Text(
            'English',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.primary[200],
            ),
          ),
        ],
      ),
    );
  }

  // Build the header text with a welcome message
  Widget _buildHeaderText(double screenWidth) {
    return Column(
      children: [
        Text(
          'Welcome to JKT48 PM!',
          style: GoogleFonts.plusJakartaSans(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          'Here, you can receive messages from all JKT48 members directly. Let\'s start connecting with your favorite idols now!',
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            fontSize: screenWidth * 0.03,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // Build the login button
  Widget _buildLoginButton(double screenWidth) {
    return ElevatedButton(
      onPressed: () => _showBottomSheet(context, BottomSheetLoginWidget()),
      style: ElevatedButton.styleFrom(
        primary: AppColors.pink[500],
        onPrimary: AppColors.neutral[0],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        fixedSize: Size(screenWidth * 0.8, 44),
      ),
      child: Text('Log In'),
    );
  }

  // Build the sign-up button
  Widget _buildSignUpButton(double screenWidth) {
    return ElevatedButton(
      onPressed: () => _showBottomSheet(context, BottomSheetSignUpWidget()),
      style: ElevatedButton.styleFrom(
        primary: AppColors.neutral[0],
        onPrimary: AppColors.pink[500],
        side: BorderSide(color: AppColors.pink[500]!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        fixedSize: Size(screenWidth * 0.8, 44),
      ),
      child: Text("I'm New, Sign Me Up"),
    );
  }

  // Build the text for terms and privacy information
  Widget _buildTermsAndPrivacyText() {
    return Column(
      children: [
        Text(
          'By logging in or registering, you agree to our',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Terms of Service',
              style: TextStyle(fontSize: 12, color: AppColors.pink[500]),
            ),
            Text(
              ' and ',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 12, color: AppColors.pink[500]),
            ),
          ],
        ),
      ],
    );
  }

  // Show the bottom sheet (login or sign-up)
  void _showBottomSheet(BuildContext context, Widget bottomSheet) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => bottomSheet,
    );
  }
}
