import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carosler extends StatelessWidget {
  const Carosler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 30,
        child: CarouselSlider.builder(
          itemCount: 1,
          itemBuilder: (context, int ooo, int real) {
            return Container(
                height: 25,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ));
          },
          options: CarouselOptions(
            height: 30,
            viewportFraction: 0.0,
            enableInfiniteScroll: true,
            autoPlay: true,
            // autoPlayInterval: const Duration(seconds: 2),
            // autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            // autoPlayCurve: Curves.easeInExpo,
            // enlargeCenterPage: true,
          ),
        ),
      ),
    );
  }
}
