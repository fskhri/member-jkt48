import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'loading_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  // Controller to control the animation
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController with a duration of 3 seconds
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    // Start the animation
    _controller.forward();

    // Timer to navigate to the next page after 4 seconds
    Timer(
      Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoadingPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background using SVG image
          SvgPicture.asset(
            'assets/images/background.svg',
            fit: BoxFit.cover,
          ),
          Center(
            child: RotationTransition(
              turns: _controller,
              child: ScaleTransition(
                scale: _controller,
                // Logo using PNG image
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Release resources when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
}
