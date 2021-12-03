import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:stemo/theme/colors.dart';

class FindEmailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    //final controller = Get.put(LoginController());

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
              //key: controller.loginFormKey,
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
                          '이메일 찾기',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.06),
                        Text(
                          '이름',
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
                            hintText: '이름 입력',
                            //suffixIcon: Icon(Icons.check),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          //controller: controller.emailController,
                          //focusNode: controller.emailFocusNode,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            //controller.email = value!;
                          },
                          validator: (value) {
                            //return controller.validateEmail(value!);
                          },
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          '휴대폰번호',
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
                            hintText: '휴대폰번호 입력',
                            //suffixIcon: Icon(Icons.check),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          //controller: controller.emailController,
                          //focusNode: controller.emailFocusNode,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            //controller.email = value!;
                          },
                          validator: (value) {
                            //return controller.validateEmail(value!);
                          },
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
                  '이메일 찾기',
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
                  //controller.checkLogin();
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