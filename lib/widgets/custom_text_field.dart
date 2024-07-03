import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import '../theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? iconImage;
  final Color? iconColor;
  final bool? isdigitOnly;
  final int? maxLength;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.iconColor = darkPink,
    this.iconImage,
    this.maxLength,
    this.isdigitOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<TextInputFormatter> inputFormatters = [];

    if(isdigitOnly == true){
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    return TextField(
      controller: controller,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) => null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: iconImage != null ? ImageIcon(AssetImage(iconImage!)) : null,
        prefixIconColor:iconColor != null ? iconColor! : darkPink,
        labelStyle: const TextStyle(color: lightGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: darkGrey),
        ),
        focusColor: lightGrey,
      ),
      cursorColor: lightGrey,
    );
  }
}
