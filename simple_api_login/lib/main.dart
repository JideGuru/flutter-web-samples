import 'package:flutter/material.dart';
import 'package:simple_api_login/pages/signup.dart';
import 'package:simple_api_login/util/theme_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      theme: ThemeConfig.lightTheme,
      home: CreateAccount(),
    );
  }
}
