import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stemo/theme/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    //var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.46),
            Center(
              child: Container(
                child: SvgPicture.asset(
                  'assets/images/intro_logo.svg',
                  width: screenHeight * 0.35,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Center(
              child: Container(
                child: SvgPicture.asset(
                  'assets/images/intro_team_name.svg',
                  width: screenHeight * 0.165,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.065),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      //Get.offAll(StartScreen());
      Get.offAllNamed('/start');
    });
  }
}
