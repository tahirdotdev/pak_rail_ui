// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pak_rail_login_ui/pages/login_screen.dart';

import '../colors/MyColors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/bcg.jpg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height /
                  2, // adjust the height to your liking
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.2),
                    Colors.transparent,
                  ],
                  stops: const [0.1, 0.5, 1],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 150,
            width: 150,
            margin: const EdgeInsets.only(top: 110, left: 130, right: 50),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3D3B3A3A),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  )
                ],
                color: const Color(0x3D3B3A3A),
                borderRadius: BorderRadius.circular(100)),
          ),
          Container(
            height: 300,
            width: 300,
            margin: const EdgeInsets.only(top: 80, left: 60, right: 50),
            child: Image.asset(
              "images/mainLogo.png",
              height: 56,
              width: 56,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 80, right: 30, top: 240),
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  colors: [MyColors.gradientIn, MyColors.gradientOut],
                  stops: const [0.0, 1.0],
                ).createShader(rect);
              },
              child: const Text(
                "PLEASE SIGNUP!",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "WiseSans-Heavy",
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.55,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF000000).withOpacity(0.5),
                              const Color(0xFF373737).withOpacity(0.5),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  height: 40,
                                  child: const Text(
                                    "Phone Number",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "Calibre-M"),
                                  )),
                              TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: " +92      xxxxxxxxxx",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                  alignment: Alignment.topLeft,
                                  height: 40,
                                  child: const Text(
                                    "Password",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "Calibre-M"),
                                  )),
                              TextField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: "•••••••••••••",
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                  alignment: Alignment.topLeft,
                                  height: 40,
                                  child: const Text(
                                    "Repeat Password",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "Calibre-M"),
                                  )),
                              TextField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: "•••••••••••••",
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                height: 52,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFEC20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins-SemiBold',
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Flex(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  direction: Axis.horizontal,
                                  children: [
                                    Container(
                                      height: 66,
                                      width: 66,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.white), // Border color
                                        borderRadius: BorderRadius.circular(
                                            10), // Rounded corners
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            10), // Ensure image fits within rounded corners
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Image.asset(
                                            "images/Google.png",
                                            height: 20,
                                            width: 20,
                                            fit: BoxFit
                                                .cover, // Maintain image aspect ratio
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 66,
                                      width: 66,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.white), // Border color
                                        borderRadius: BorderRadius.circular(
                                            10), // Rounded corners
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            10), // Ensure image fits within rounded corners
                                        child: Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: Image.asset(
                                            "images/Apple (icon — Colour).png",
                                            height: 20,
                                            width: 20,
                                            fit: BoxFit
                                                .contain, // Maintain image aspect ratio
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 66,
                                      width: 66,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.white), // Border color
                                        borderRadius: BorderRadius.circular(
                                            10), // Rounded corners
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            10), // Ensure image fits within rounded corners
                                        child: Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: Image.asset(
                                            "images/meta-icon.png",
                                            height: 20,
                                            width: 20,
                                            fit: BoxFit
                                                .contain, // Maintain image aspect ratio
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 20,
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                                    },
                                    child: const Text(
                                      " Log In",
                                      style: TextStyle(
                                          color: Color(0xFFFFEC20),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Small bar at the top
              Positioned(
                bottom: MediaQuery.of(context).size.height / 1.61,
                left: MediaQuery.of(context).size.width / 2 - 25,
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
