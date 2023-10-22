import 'package:book_explorer/data/local/dao/user_dao.dart';
import 'package:book_explorer/view/login_page.dart';
import 'package:book_explorer/viewmodel/login_view_model.dart';
import 'package:book_explorer/viewmodel/search_result_view_model.dart';
import 'package:book_explorer/viewmodel/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/local/database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .build();
  final userDao = database.userDao;

  runApp( MyApp(userDao: userDao,));
}

class MyApp extends StatelessWidget {
  UserDao userDao;
   MyApp({Key? key,required this.userDao}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> SearchResultViewModel()),
      ChangeNotifierProvider(create: (_)=>SignUpViewModel(userDao)),
      ChangeNotifierProvider(create: (_)=>LoginViewModel(userDao)),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:LoginPage(),
    ),);
  }
}
