
import 'package:condition/screens/signup_screen/signup_screen2.dart';
import 'package:condition/screens/signup_screen/user_detail_model.dart';
import 'package:condition/theme/colors.dart';
import 'package:condition/widgets/custom_button.dart';
import 'package:condition/widgets/custom_text_field.dart';
import 'package:condition/widgets/headder_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../widgets/custom_snackbar.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController mnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();

  String displayedName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fnameController.addListener(updateDisplayedName);
  }

  @override
  void dispose() {
    fnameController.removeListener(updateDisplayedName);
    fnameController.dispose();
    mnameController.dispose();
    lnameController.dispose();
    super.dispose();
  }

  void updateDisplayedName() {
    setState(() {
      displayedName = fnameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Assessment',
          style: GoogleFonts.poppins(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset('assets/actions/backAction.png',
                width: 50, height: 50)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const HeadderImage(
                  img1: 'assets/idols/BigRectangle.png',
                  img2: 'assets/idols/Dr_Hi.png',
                ),
                Positioned(
                  top: 150,
                    right: 50,
                    left: 50,
                    child: Align(
                      alignment: Alignment.center,
                  child: Text('What Should We call You?',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19))),
                )),
                Positioned(
                  top: 180,
                    right: 40,width: 150,height: 150,
                    child: Semantics(child: Image.asset('assets/icons/commentLogo.png')),
                ),
                Positioned(
                    top: 233,
                    right: 90,
                    child: Column(
                      children: [
                        Text('Hello👋',style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),),
                        Text(displayedName,style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),),

                      ],
                    ))
              ],
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomTextField(
                        controller: fnameController,
                        label: 'Enter your First Name',
                        iconImage: 'assets/icons/person.png',
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: mnameController,
                        label: 'Enter your Middle Name',
                        iconImage: 'assets/icons/person.png',
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: lnameController,
                        label: 'Enter your Last Name',
                        iconImage: 'assets/icons/person.png',
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.06),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: CustomButton(
                      callback: (){
                        _validateAndContinue();
                      },
                      btnName: 'Continue',
                      bgColor: primaryColor,
                      textStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
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

  void _validateAndContinue() {
    if (fnameController.text.isEmpty || mnameController.text.isEmpty || lnameController.text.isEmpty) {
      showCustomSnackBar('Please fill all the fields', false);
    } else {
      UserSignInData usersignindata = UserSignInData(
        firstName: fnameController.text,
        secondName: mnameController.text,
        lastName: lnameController.text,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen2()));
    }
  }

}
