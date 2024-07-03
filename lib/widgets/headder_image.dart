import 'package:flutter/material.dart';

class HeadderImage extends StatelessWidget {
  final String img1;
  final String img2;
  const HeadderImage({super.key, required this.img1, required this.img2});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(img1,
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
        ),
        Image.asset(img2,
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width * 0.8,// Example fit, adjust as needed
        ),
      ],
    );
  }
}
