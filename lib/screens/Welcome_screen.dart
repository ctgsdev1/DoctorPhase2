import 'package:condition/screens/login_screen/Login_screen.dart';
import 'package:condition/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.05),
                      const Image(image: AssetImage('assets/logo.png')),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.05),
                      Text(
                        '"One stop for all healthcare needs\n for you and your family."',
                        style: GoogleFonts.poppins(
                          textStyle:
                              const TextStyle(fontSize: 18, color: lightGrey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Image(
                      image: AssetImage('assets/loginScreenImage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Buttons:-
                        Column(
                          children: [
                            CustomButton(
                              btnName: 'LOGIN',
                              textStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white,fontSize: 20)),
                              bgColor: primaryColor,
                              callback: (){
                                print('Login clicked');
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                              btnName: 'SIGN UP',
                              textStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: primaryColor,fontSize: 20)),
                              bgColor: Colors.white,
                              callback: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
                                print('Sign Up clicked');
                              },
                              borderColor: primaryColor,
                              borderThickness: 2.0,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        //Divider and Guest mode text:-
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Divider
                            const Row(
                              children: [
                                Expanded(child: Divider(color: lightGrey)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text('OR'),
                                ),
                                Expanded(child: Divider(color: lightGrey)),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.08),
                            //GuestMode text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Want to just Export? ',style: GoogleFonts.poppins(textStyle: const TextStyle(color: lightGrey)),),
                                InkWell(
                                    onTap: (){print('guest mode');},
                                    child: Text('Enter Guest Mode',style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.blueAccent)),))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
