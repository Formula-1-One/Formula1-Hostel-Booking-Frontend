// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatefulWidget {

  final List<dynamic> imagesListUrl;

  CarouselImages(this.imagesListUrl);

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    // this is a  container
    return Container(
      height: size.height * 0.35,
      child: Carousel(
        dotSize: 5,
        dotBgColor: Colors.transparent,
        autoplay: true,
        images: widget.imagesListUrl.map((imageUrl) => NetworkImage(imageUrl)).toList(),
      ),
    );
  }
}
