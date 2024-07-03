import 'package:condition/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomSnackBarContent extends StatelessWidget {
  final String message;
  final VoidCallback onClose;
  final bool success;

  const CustomSnackBarContent(
      {required this.message, required this.onClose, Key? key, required this.success})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: success == true? lightGreen : lightPink,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          bottom: (BorderSide(
            color: success == true ? darkGreen : darkPink,
            width: 6.0,
          ))
        )
      ),
      child: Row(
        children: [
          // SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          // const Icon(Icons.info, color: Colors.red,size: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Image.asset(success == true ? 'assets/icons/snackbar_success.png' : 'assets/icons/snackbar_error.png',width: 25,height: 25),
              ),
          Expanded(
            child: DefaultTextStyle(
                style:  GoogleFonts.poppins(textStyle: TextStyle(color:success == true ? darkGreen: darkPink, fontSize: 14,fontWeight: FontWeight.bold)),
                child: Text(
                    message,
                    textAlign: TextAlign.center),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color:success == true ? darkGreen : darkPink, size: 25),
            onPressed: (){
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },

          ),
        ],
      ),
    );
  }
}
