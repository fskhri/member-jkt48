import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/color.dart';
import '../../widget/BottomSheet_Widget.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 55.0),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                    Image.asset(
                      "assets/images/logoload.png",
                      width: screenWidth * 0.5,
                    ),
                    SizedBox(height: screenHeight * 0.02),
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

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        _buildLanguageButton(),
      ],
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/logoload.png',
      height: 55,
      width: 55,
    );
  }

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

  Widget _buildLoginButton(double screenWidth) {
    return ElevatedButton(
      onPressed: () {
        _showBottomSheet(context);
      },
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

  Widget _buildSignUpButton(double screenWidth) {
    return ElevatedButton(
      onPressed: () {
        // Add sign-up button functionality
      },
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CustomBottomSheet(),
    );
  }
}
