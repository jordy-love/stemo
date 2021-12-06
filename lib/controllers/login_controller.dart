import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stemo/theme/colors.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userData = GetStorage();
  var logger = Logger();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  String? validateEmail(String value) {
    print("fn:validateEmail()");
    if (!GetUtils.isEmail(value) && !emailFocusNode.hasFocus && value.isNotEmpty) {
      return '*올바른 이메일 형식이 아닙니다.';
    }
    return null;
  }

  String? validatePassword(String value) {
    print("fn:validatePassword()");
    if (value.length < 8 && !passwordFocusNode.hasFocus && value.isNotEmpty) {
      return '*영어 소문자, 숫자, 특수문자 포함 8자리 이상';
    }
    return null;
  }

  void checkLogin() {
    print("fn:checkLogin()");
    final isValid =
        loginFormKey.currentState!.validate(); // TextFormField()내의 validator 실행
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save(); // onSaved()실행

    var checkUserEmail = 'test@test.com'; //'stemo.team@gmail.com';
    var checkUserPassword = '00000000'; //'vmfflsdl9@';
    logger.d(email.compareTo(checkUserEmail));

    if (email.compareTo(checkUserEmail) != 0 ||
        password.compareTo(checkUserPassword) != 0) {
      userDataFailDialog();

    } else {
      userData.write('user_id', email);
      logger.d('로그인완료:' + userData.read('user_id'));
      Get.offAllNamed('/');
    }
  }

  void userDataFailDialog() {
    Get.dialog(
      Dialog(
        child: Container(
          height: 200,
          child: Column(
            children: [
              //SizedBox(height: 25),
              Stack(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      height: 10,
                      minWidth: 10,
                      color: mainBtnColor,
                      shape: CircleBorder(),
                      onPressed: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 25),
                    child: Image.asset(
                      'assets/images/alert_face_sweet.png',
                      width: 60,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '앗!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '이메일과 비밀번호가 일치하지 않습니다.\n이메일과 비밀번호를 확인해 주세요.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
