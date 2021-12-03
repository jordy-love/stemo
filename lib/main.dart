import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stemo/views/find/find_email_view.dart';
import 'package:stemo/views/find/find_password_view.dart';
import 'package:stemo/views/login/login_email_view.dart';
import 'package:stemo/views/login/login_view.dart';
import 'package:stemo/views/main_view.dart';
import 'package:stemo/views/splash/splash_view.dart';
import 'package:stemo/views/start/start_view.dart';

void main() async {
  await GetStorage.init();
  runApp(Stemo());
}

class Stemo extends StatelessWidget {
  const Stemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'STEMO',
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/',
          page: () => MainView(),
        ),
        GetPage(
          name: '/splash',
          page: () => SplashView(),
        ),
        GetPage(
          name: '/start',
          page: () => StartView(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginView(),
        ),
        GetPage(
          name: '/login_email',
          page: () => LoginEmailView(),
        ),
        GetPage(
          name: '/find_email',
          page: () => FindEmailView(),
        ),
        GetPage(
          name: '/find_password',
          page: () => FindPasswordView(),
        ),
      ],
    );
  }
}
