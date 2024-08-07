// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pak_rail_login_ui/pages/sign_up_screen.dart';
import '../colors/MyColors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  bool _obscureText = true;
  String _selectedCountryCode = '+92';
  final List<String> _countryCodes = ['+1', '+44', '+91', '+92', '+33']; // Add more codes as needed
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            // Background image
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

            // "WELCOME BACK!" text with gradient
            Container(
              margin: const EdgeInsets.only(left: 105, right: 50, top: 240),
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    colors: [MyColors.gradientIn, MyColors.gradientOut],
                    stops: const [0.0, 1.0],
                  ).createShader(rect);
                },
                child: const Text(
                  "WELCOME BACK!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "WiseSans-Heavy",
                  ),
                ),
              ),
            ),

            // "PLEASE LOGIN" text with gradient
            Container(
              margin: const EdgeInsets.only(left: 89, right: 50, top: 280),
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    colors: [MyColors.gradientIn, MyColors.gradientOut],
                    stops: const [0.0, 1.0],
                  ).createShader(rect);
                },
                child: const Text(
                  "PLEASE LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 0.9,
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "WiseSans-Heavy",
                  ),
                ),
              ),
            ),

            // Blur and gradient effect at the bottom with form
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.65,
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
                              Row(
                                children: [
                                  // Dropdown button for country code selection
                                  DropdownButton<String>(
                                    dropdownColor: Colors.black87,
                                    value: _selectedCountryCode,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedCountryCode = newValue!;
                                      });
                                    },
                                    items: _countryCodes.map((String code) {
                                      return DropdownMenuItem<String>(
                                        value: code,
                                        child: Text(code,style: TextStyle(color: Colors.white),),
                                      );
                                    }).toList(),
                                  ),
                                  // TextField for phone number input
                                  Expanded(
                                    child: TextField(
                                      controller: _phoneController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: 'xxxxxxxxxx',
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none, // Remove border
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                      ),
                                    ),
                                  ),
                                ],
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
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          _isChecked = value!;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Keep me logged in.',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 52,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFFFEC20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: const Text(
                                      "Log In",
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
                                      "Don't have an account?",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUpScreen()));
                                      },
                                      child: const Text(
                                        " Sign Up",
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
                  bottom: MediaQuery.of(context).size.height / 1.66 - 20,
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
      ),
    );
  }
}
