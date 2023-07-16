import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wifilockproject/screens/HomePageScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //we use future to go from one screen to other via duration time
    Future.delayed(Duration(seconds: 3), (){
      //no return when user is on login screen and press back, it will not return the
      //user to the splash screen
      Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var h;
    return Scaffold(
      body: Stack(
        children: [
          // Arka plan resmi
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/hotel.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          // Bulanık arka plan
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.3),
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          // Sayfa içeriği
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HOTEL',
                        style: GoogleFonts.dancingScript(textStyle: TextStyle(
                          fontSize: 100,
                          color: Colors.orangeAccent,
                        )),
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .headline5
                        //     ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        'ŞAHANE',
                        style: GoogleFonts.dancingScript(textStyle: TextStyle(
                          fontSize: 100,
                          color: Colors.orangeAccent,
                        )),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
