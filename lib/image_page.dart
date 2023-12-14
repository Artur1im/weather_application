import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  List images = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      image: AssetImage("imag/" + images[index]),
                      fit: BoxFit.cover),
                ),
                child: Column(
                    children: List.generate(4, (indexDots) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 8,
                    height: index == indexDots ? 25 : 8,
                    decoration: const BoxDecoration(color: Colors.orange),
                  );
                })));
          }),
    );
  }
}
