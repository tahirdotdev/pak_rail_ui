// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pak_rail_login_ui/pages/home.dart';

import '../colors/MyColors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  int _remainingTime = 60; // Initial time in seconds

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
          // Gradient overlay at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
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
          // Back arrow at the top
          Positioned(
            top: 55,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  Text(
                    " Back",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
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
                    color: Color(0x252F2D2D),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
                color: const Color(0x3D3B3A3A),
                borderRadius: BorderRadius.circular(100)),
          ),
          // Main logo
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
            margin: const EdgeInsets.only(left: 110, right: 20, top: 240),
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  colors: [MyColors.gradientIn, MyColors.gradientOut],
                  stops: const [0.0, 1.0],
                ).createShader(rect);
              },
              child: const Text(
                "VERIFY OTP!",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "WiseSans-Heavy",
                ),
              ),
            ),
          ),
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
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 195,
                              width: 200.13,
                              child: Image.asset(
                                "images/otp.png",
                              )),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(7, (index) {
                              if (index % 2 == 0) {
                                return Container(
                                  width: 66.0,
                                  height: 66.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    decoration: InputDecoration(
                                      counterText: "",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: const BorderSide(
                                            color: Colors.yellow, width: 2),
                                      ),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                );
                              } else {
                                return const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 35.0, color: Colors.white),
                                  ),
                                );
                              }
                            }),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Didn't receive the OTP?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                " Request again in ${_remainingTime ~/ 60}:${_remainingTime % 60 < 10 ? '0' : ''}${_remainingTime % 60}",
                                style: const TextStyle(
                                  color: Color(0xFFFFEC20),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 52,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFEC20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "VERIFY",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins-SemiBold',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
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
    );
  }
}
