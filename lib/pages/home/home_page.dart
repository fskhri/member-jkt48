import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pm_member/utils/color.dart';

import '../../widgets/Card_Slider_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 55.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(text: 'Hallo, '),
                      TextSpan(
                        text: 'eka',
                        style: TextStyle(
                          color: AppColors.primary[400],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset('assets/icons/notification.svg'),
              ],
            ),
            SizedBox(height: 25),
            LayoutBuilder(
              builder: (context, constraints) {
                double containerWidth =
                    constraints.maxWidth > 500 ? 500 : constraints.maxWidth;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: containerWidth,
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '“Kathrina”',
                                hintStyle:
                                    TextStyle(color: AppColors.pink[500]),
                                filled: true,
                                fillColor: AppColors.primary[800],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 12.0,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.pink[500],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Search',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.pink[500],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Most subscribed members',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.primary[400],
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Most active member of the week',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.primary[400],
                      ),
                    ),
                    SizedBox(height: 14),
                    MyCardSlider(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
