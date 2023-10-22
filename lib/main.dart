import 'package:book_explorer/view/login_page.dart';
import 'package:book_explorer/view/search_page.dart';
import 'package:book_explorer/view/search_result_page.dart';
import 'package:book_explorer/view/setting_page.dart';
import 'package:book_explorer/widgets/book_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:LoginPage(),
    );
  }
}
