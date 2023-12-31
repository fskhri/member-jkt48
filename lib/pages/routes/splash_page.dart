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
  // Controller untuk mengontrol animasi
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController dengan durasi 3 detik
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    // Tween untuk mengatur animasi skala dari 0.5 ke 1.0
    final Animation<double> scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(_controller);

    // Memulai animasi
    _controller.forward();

    // Timer untuk berpindah ke halaman berikutnya setelah 4 detik
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
          // Background menggunakan gambar SVG
          SvgPicture.asset(
            'assets/images/background.svg',
            fit: BoxFit.cover,
          ),
          Center(
            child: RotationTransition(
              turns: _controller,
              child: ScaleTransition(
                scale: _controller,
                // Logo menggunakan gambar PNG
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
    // Melepaskan sumber daya saat widget dihapus
    _controller.dispose();
    super.dispose();
  }
}
