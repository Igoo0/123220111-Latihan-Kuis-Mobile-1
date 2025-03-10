import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodApp',
      home: LoginPage(),
    );
  }
}
