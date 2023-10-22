import 'package:book_explorer/view/login_page.dart';
import 'package:book_explorer/view/search_result_page.dart';
import 'package:book_explorer/view/setting_page.dart';
import 'package:book_explorer/viewmodel/search_result_view_model.dart';
import 'package:book_explorer/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> SearchResultViewModel())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:LoginPage(),
    ),);
  }
}
