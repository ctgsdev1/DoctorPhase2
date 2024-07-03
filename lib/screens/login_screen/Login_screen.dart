import 'package:condition/screens/login_screen/login_verification_screen.dart';
import 'package:condition/screens/signup_screen/signup_screen.dart';
import 'package:condition/theme/colors.dart';
import 'package:condition/widgets/custom_button.dart';
import 'package:condition/widgets/custom_text_field.dart';
import 'package:condition/widgets/headder_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:condition/widgets/custom_snackbar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedToggle = 0; //o for email, 1 for phone
  bool rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadderImage(
                img1: 'assets/idols/Rectangle.png',
                img2: 'assets/idols/Dr_Hi.png'),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.acme(
                            textStyle: const TextStyle(fontSize: 35)),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                          '"One stop for all healthcare needs\n for you and your family."',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: lightGrey, fontSize: 16))),
                      SizedBox(height: screenHeight * 0.03),
                      Center(
                          child: ToggleSwitch(
                        minWidth: screenWidth * 0.8,
                        cornerRadius: 20,
                        borderColor: const [primaryColor],
                        radiusStyle: true,
                        animate: true,
                        animationDuration: 500,
                        curve: Curves.linear,
                        initialLabelIndex: selectedToggle,
                        totalSwitches: 2,
                        borderWidth: 1,
                        labels: const ['Email', 'Mobile'],
                        activeBgColor: const [primaryColor],
                        inactiveBgColor: Colors.white,
                        activeFgColor: Colors.white,
                        inactiveFgColor: primaryColor,
                        onToggle: (index) {
                          print('switched to: $index');
                          setState(() {
                            selectedToggle = index!;
                          });
                          // selectedToggle = index!;
                        },
                      )),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        selectedToggle == 0 ? 'Email' : 'Mobile Number',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      selectedToggle == 0
                          ? CustomTextField(
                              controller: emailController,
                              label: 'Enter Email',
                              iconImage: 'assets/icons/mail.png',
                              iconColor: darkPink,
                            )
                          : CustomTextField(
                              controller: phoneController,
                              isdigitOnly: true,
                              maxLength: 10,
                              label: 'Enter Mobile Number',
                              iconImage: 'assets/icons/mobile.png',
                              iconColor: darkPink,
                            ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                activeColor: Colors.blueAccent,
                                side: const BorderSide(
                                    color: lightGrey, width: 1),
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberMe = value ?? false;
                                  });
                                },
                              ),
                              Text(
                                'Remember me',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: lightGrey, fontSize: 14)),
                              ),
                            ],
                          ),
                          InkWell(
                              onTap: () {},
                              child: Text(
                                'Forget Password?',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold)),
                              ))
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomButton(
                        callback: _validateAndLogin,
                        btnName: 'LOGIN',
                        bgColor: primaryColor,
                        textStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 18)),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                                },
                                child: Text(
                                                            "Don't have an account? Sign Up",
                                                            style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold)),
                                                          ),
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
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

  //Email and phone validate:
  void _validateAndLogin() {
    if (selectedToggle == 0) {
      //Email validation
      String email = emailController.text;
      if(email.isEmpty){
        showCustomSnackBar('Please enter your E-mail', false);
      }
      else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
        showCustomSnackBar('Please enter correct E-mail', false);
      } else {
        //proceed with login
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginVerificationScreen(isPhoneVerification: false)));
      }
    } else {
      //phone number validation
      String phone = phoneController.text;
      if(phone.isEmpty){
        showCustomSnackBar('Please enter your Number', false);
      }
      else if (phone.length != 10 || !RegExp(r'^\d{10}$').hasMatch(phone)) {
        showCustomSnackBar('Please enter correct Number', false);
      } else {
        //proceed with login
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginVerificationScreen(isPhoneVerification: true)));
      }
    }
  }
}
