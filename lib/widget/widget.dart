import 'package:flutter/material.dart';

@immutable
//ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  final VoidCallback onPressend;
  final String buttomText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressend,
      child: Text(buttomText),
    );
  }

  const CustomButtom(
      {super.key, required this.onPressend, required this.buttomText});
}

@immutable
//ignore: must_be_immutable
class Name extends StatelessWidget {
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.purple, fontStyle: FontStyle.italic),
    );
  }

  Name({
    super.key,
    required this.text,
  });
}

class SunWeather extends StatelessWidget {
  final String foto;
  final String text1;
  final String text2;

  SunWeather(
      {super.key,
      required this.foto,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          foto,
          scale: 8,
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text2,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
