import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_app/screens/home_screen.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "じゃんけんアプリ",
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
