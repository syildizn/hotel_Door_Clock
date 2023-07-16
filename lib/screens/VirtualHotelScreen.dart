import 'package:flutter/material.dart';

import '../HomeCard.dart';

class VirtualHotel extends StatefulWidget {
  static String routeName = 'VirtualHotelScreen';
  const VirtualHotel({Key? key}) : super(key: key);

  @override
  State<VirtualHotel> createState() => _VirtualHotelState();
}

class _VirtualHotelState extends State<VirtualHotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sanal Otel")),
      backgroundColor: Colors.orangeAccent,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeCard(

                onPress: () {

                },
                icon: 'assets/icons/housekeeping.svg',
                title: 'Oda Servisi',
                color: Colors.white,
                //colortext:  homecard1,
              ),
              HomeCard(

                onPress: () {

                },
                icon: 'assets/icons/lobi.svg',
                title: 'Lobi',
                color: Colors.white,
                //colortext:  homecard1,
              ),
              HomeCard(

                onPress: () {

                },
                icon: 'assets/icons/acikbufe.svg',
                title: 'Açık Büfe',
                color: Colors.white,
                //colortext:  homecard1,
              ),
            ],
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeCard(

                onPress: () {

                },
                icon: 'assets/icons/spa.svg',
                title: 'Spa',
                color: Colors.white,
                //colortext:  homecard1,
              ),
              HomeCard(

                onPress: () {

                },
                icon: 'assets/icons/havuzz.svg',
                title: 'Havuz',
                color: Colors.white,
                //colortext:  homecard1,
              ),
              HomeCard(

                onPress: () {

                },
                icon: 'assets/icons/aktivite.svg',
                title: 'Aktiviteler',
                color: Colors.white,
                //colortext:  homecard1,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
