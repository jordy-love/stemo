import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:stemo/theme/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.002),
          color: mainFontColor,
          icon: Icon(Icons.arrow_back),
          //iconSize: 30,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                primary: Color(0XFF858C94),
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05)),
            onPressed: () {
              //Get.toNamed('/');
              //Get.offNamed('/');
              Get.offAllNamed('/');
            },
            child: Text('둘러보기'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.13, right: screenWidth * 0.13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.22),
            Center(
              child: Container(
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
                      primary: kakaoFontColor,
                      backgroundColor: kakaoMainColor,
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                      elevation: 0,
                      side: BorderSide(color: kakaoMainColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      flutterToast('서비스 준비중이에요.😢');
                    },
                    child: Text('카카오로 로그인'),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Container(
                  width: screenWidth,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: naverMainColor,
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                      elevation: 0,
                      side: BorderSide(color: naverMainColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      flutterToast('서비스 준비중이에요.😢');
                    },
                    child: Text('네이버로 로그인'),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Container(
                  width: screenWidth,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: mainBtnColor,
                      backgroundColor: Colors.white,
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                      elevation: 0,
                      side: BorderSide(color: mainBtnColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('/login_email');
                    },
                    child: Text('이메일로 로그인'),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  width: screenWidth,
                  alignment: Alignment.center,
                  child: Text(
                    '이메일로 회원가입',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.115),
          ],
        ),
      ),
    );
  }

  void flutterToast(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
//Get.snackbar('오잉', message);
}
