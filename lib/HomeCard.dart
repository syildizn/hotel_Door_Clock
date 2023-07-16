import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
        required this.onPress,
        required this.icon,
        required this.title,
        required this.color,
        //required this.colortext
      })
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;
  final Color color;
  //final Color colortext;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1),
        width: 110,
        height:140,
        decoration: BoxDecoration(

          color: color,
          borderRadius: BorderRadius.circular(20 / 2),
          //       boxShadow: [
          //       BoxShadow(
          //       offset: Offset(0,-10),
          //   blurRadius: 35,
          //   color: Colors.black12.withOpacity(0.17),
          // )]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height:  50,//SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              width:70 ,color: Colors.black, //SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              //color: null,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19
              ),
            ),
          ],
        ),
      ),
    );
  }
}