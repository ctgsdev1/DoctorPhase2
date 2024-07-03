

import 'package:condition/theme/colors.dart';
import 'package:condition/widgets/custom_button.dart';
import 'package:condition/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginVerificationScreen extends StatefulWidget {

  final bool isPhoneVerification;

  const LoginVerificationScreen({super.key, required this.isPhoneVerification});

  @override
  State<LoginVerificationScreen> createState() => _LoginVerificationScreenState();
}

class _LoginVerificationScreenState extends State<LoginVerificationScreen> {

  TextEditingController pinController = TextEditingController();
  String _otp = '';

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/otp.png'),
              SizedBox(height: height * 0.1),
              Text(widget.isPhoneVerification ? 'Phone Verification' : 'Email Verification',style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
              SizedBox(height: height * 0.02),
              Center(child: Text(textAlign: TextAlign.center,widget.isPhoneVerification?
              'Please enter the 6 digit code sent to your\n phone':
              'Please enter the 6 digit code sent to your\n email',style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16,color: lightGrey)))),
              SizedBox(height: height * 0.08),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    PinCodeTextField(
                      enableActiveFill: true,
                        appContext: context,
                        length: 6,
                      keyboardType: TextInputType.number,
                      controller: pinController,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 0.5,
                        fieldHeight: 47,
                        fieldWidth: 47,
                        activeColor: lightOrange,
                        inactiveColor: lightOrange,
                        selectedColor: primaryColor,
                        selectedFillColor: lightOrange,
                        activeFillColor: lightOrange,
                        inactiveFillColor: lightOrange,
                      ),
                      onChanged: (value){
                          _otp = value;
                      },
                    ),
                    SizedBox(height: height * 0.17),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't receive code? ",style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,color: lightGrey))),
                        Text('Re-send',style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.w500)),)
                      ],
                    ),
                    SizedBox(height: height * 0.05),
                    CustomButton(
                        btnName: 'Verify',
                        textStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white,fontSize: 18)),
                        bgColor: primaryColor,
                      callback: (){
                        _verifyOtp();
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void showCustomSnackBar(String message, bool isSuccess) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBarContent(
        success: isSuccess,
        message: message,
        onClose: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      displayDuration: const Duration(seconds: 3),
    );
  }

  //Email and phone validate:
  void _verifyOtp() {
    if (_otp.isEmpty) {
      showCustomSnackBar('Please enter the OTP', false);
      return;
    }

    int otp;
    try {
      otp = int.parse(_otp);
    } catch (e) {
      showCustomSnackBar('Invalid OTP format', false);
      return;
    }



    if (widget.isPhoneVerification == true) {
      //Phone validation
      if (otp == 222222) {
        showCustomSnackBar('Number Verified Successfully', true);
      } else {
        showCustomSnackBar('Entered Wrong OTP', false);
        //proceed with login
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginVerificationScreen(isPhoneVerification: false)));
      }
    } else {
      //Email validation
      if (otp == 222222) {
        showCustomSnackBar('Email Verified Successfully', true);
      } else {
        showCustomSnackBar('Entered Wrong OTP', false);
        //proceed with login
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginVerificationScreen(isPhoneVerification: true)));
      }
    }
  }

}
