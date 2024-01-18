import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  List<String> imageList = [
    'assets/images/member/celline1.jpeg',
    'assets/images/member/desynata1.jpeg',
    'assets/images/member/graceocta1.jpeg',
    'assets/images/member/greesella1.jpeg',
    'assets/images/member/indah1.jpeg',
    'assets/images/member/marsha1.jpeg',
    'assets/images/member/michelle1.jpeg'
  ];

  List<String> imageDescriptions = [
    'Description for Image 1',
    'Description for Image 2',
    'Description for Image 3', // Add more descriptions as needed
    'Description for Image 4',
    'Description for Image 5',
    'Description for Image 6',
    'Description for Image 7',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageList.length,
      options: CarouselOptions(
        height: 200.0,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        viewportFraction: 0.3,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Container(
          height: 150,
          width: 130,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  imageDescriptions[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                imageList[index],
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
