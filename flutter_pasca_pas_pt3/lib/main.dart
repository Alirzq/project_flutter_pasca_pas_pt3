import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Pages/login_page.dart';
import 'Pages/register_page.dart';
import 'Pages/home_page.dart';
import 'Pages/welcome_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Ebook App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Definisikan routes di sini
      getPages: [
        GetPage(name: '/', page: () => WelcomePage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => MainPage()),
      ],
      initialRoute: '/',
    );
  }
}
