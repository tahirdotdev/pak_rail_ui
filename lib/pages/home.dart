// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pak_rail_login_ui/colors/MyColors.dart';
import 'package:pak_rail_login_ui/pages/login_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
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
              height: 350,
              width: 350,
              margin: const EdgeInsets.only(top: 80, left: 50, right: 50),
              child: Image.asset(
                "images/mainLogo.png",
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 500),
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect rect) {
                      return LinearGradient(
                        colors: [
                          MyColors.gradientIn,
                          MyColors.gradientOut
                        ], // Remove leading zeros
                        stops: const [0.0, 1.0],
                      ).createShader(rect);
                    },
                    child: const Text(
                      "SEAMLESS BOOKING",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "WiseSans-Heavy"),
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (Rect rect) {
                      return LinearGradient(
                        colors: [
                          MyColors.gradientIn,
                          MyColors.gradientOut
                        ], // Remove leading zeros
                        stops: const [0.0, 1.0],
                      ).createShader(rect);
                    },
                    child: const Text(
                      "EFFORTLESS TRAVEL",
                      style: TextStyle(
                          height: 1,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'WiseSans-Heavy'),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.only(left: 50, right: 50),

                    child: const Text(
                      "Experience the convenience of modern travel\nwith Pakistan Railways' online booking system",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Calibre-M"),
                      maxLines: 2, // Add this line
                      // overflow: TextOverflow.ellipsis, // Add this line to show ellipsis at the end of the second line
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFEC20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
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
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins-SemiBold',
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

PageRouteBuilder _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const LoginScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
