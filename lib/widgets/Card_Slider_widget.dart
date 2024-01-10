import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCardSlider extends StatelessWidget {
  final List<String> cardList = [
    'Card 1',
    'Card 2',
    'Card 3',
    'Card 4',
    'Card 5',
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
      ),
      items: cardList.map((card) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: 120.0,
              height: 150.0,
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  card,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
