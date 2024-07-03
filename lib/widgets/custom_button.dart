import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;
  final Color? borderColor;
  final double? borderThickness;
  const CustomButton(
      {super.key,
      required this.btnName,
      required this.bgColor,
      this.textStyle,
      this.callback,
      this.borderColor,
      this.borderThickness});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // if (callback != null) {
        //   callback!();
        // }
        callback!();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: bgColor,
          border: borderColor != null && borderThickness != null
              ? Border.all(color: borderColor!, width: borderThickness!)
              : null,
        ),
        height: MediaQuery.of(context).size.height * 0.07,
        child: Center(
          child: Text(
            btnName,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
