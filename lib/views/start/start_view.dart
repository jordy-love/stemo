import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stemo/theme/colors.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.13, right: screenWidth * 0.13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.22),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset(
                  'assets/images/start_logo.svg',
                  width: screenHeight * 0.35,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Column(
              children: [
                Container(
                  width: screenWidth,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: mainBtnColor,
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                      elevation: 0,
                      side: BorderSide(color: mainBtnColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    child: Text('로그인 후 자유롭게 이용하기'),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  width: screenWidth,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: mainFontColor,
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                      elevation: 0,
                      side: BorderSide(color: Color(0xFF858C94)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      //Get.toNamed('/');
                      Get.offAllNamed('/');
                    },
                    child: Text('어떤 어플인지 둘러보기'),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.18),
          ],
        ),
      ),
    );
  }
}
