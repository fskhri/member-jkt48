import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Member {
  final String imagePath;

  Member({required this.imagePath});
}

class MyCardSlider extends StatelessWidget {
  final List<Member> memberList = [
    Member(imagePath: 'marshalenathea1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();

    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: 150.0,
        enlargeCenterPage: false,
        autoPlay: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.4,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        scrollDirection: Axis.horizontal,
        scrollPhysics: BouncingScrollPhysics(),
      ),
      items: memberList.map((member) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: 120.0,
              height: 150.0,
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/member/${member.imagePath}',
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.24,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
