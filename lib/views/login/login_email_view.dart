import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:stemo/controllers/login_controller.dart';
import 'package:stemo/theme/colors.dart';

class LoginEmailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.002),
          color: mainFontColor,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Expanded(
                child: InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus(); //focusout
                  },
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.13,
                      right: screenWidth * 0.13,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          '이메일로 로그인',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.06),
                        Text(
                          '이메일',
                          style: TextStyle(
                            fontSize: 14,
                            color: grayFontColor,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: underlineInputBorder(grayFontColor),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.0),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle:
                                TextStyle(color: grayFontColor, fontSize: 14),
                            hintText: '이메일 입력',
                            suffixIcon: Container(width: 0,), //Icon(Icons.check),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          focusNode: controller.emailFocusNode,
                          //textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            controller.email = value!;
                          },
                          onChanged: (value) {

                          },
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          '비밀번호',
                          style: TextStyle(
                            fontSize: 14,
                            color: grayFontColor,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: underlineInputBorder(grayFontColor),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.0),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle:
                                TextStyle(color: grayFontColor, fontSize: 14),
                            hintText: '영어 소문자, 숫자, 특수문자 포함 8자리 이상',
                            suffixIcon: Container(width: 0,), //Icon(Icons.check),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          textInputAction: TextInputAction.done,
                          onSaved: (value) {
                            controller.password = value!;
                          },
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Text(
                                '이메일 찾기',
                                style: TextStyle(color: Color(0XFF565E67)),
                              ),
                              onPressed: () {
                                Get.toNamed('/find_email');
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                '|',
                              ),
                            ),
                            TextButton(
                              child: Text(
                                '비밀번호 재설정',
                                style: TextStyle(color: Color(0XFF565E67)),
                              ),
                              onPressed: () {
                                //flutterToast('서비스 준비중이에요.😢');
                                Get.toNamed('/find_password');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                child: Text(
                  '로그인',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: grayFontColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  side: BorderSide(width: 0.0),
                ),
                onPressed: () {
                  controller.checkLogin();
                },
              ),
            ),
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

  UnderlineInputBorder underlineInputBorder(Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}

/*
class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

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
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.13, right: screenWidth * 0.13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Text(
              '이메일로 로그인',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Text(
              '이메일',
              style: TextStyle(
                fontSize: 14,
                color: grayFontColor,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: underlineInputBorder(grayFontColor),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: grayFontColor, fontSize: 14),
                hintText: '이메일 입력',
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              '비밀번호',
              style: TextStyle(
                fontSize: 14,
                color: grayFontColor,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: underlineInputBorder(grayFontColor),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: grayFontColor, fontSize: 14),
                hintText: '영어 소문자, 숫자, 특수문자 포함 8자리 이상',
              ),
            ),
          ],
        ),
      ),
    );
  }

  UnderlineInputBorder underlineInputBorder(Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
*/
