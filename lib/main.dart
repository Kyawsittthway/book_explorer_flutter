import 'package:book_explorer/data/local/dao/user_dao.dart';
import 'package:book_explorer/view/login_page.dart';
import 'package:book_explorer/view/search_result_page.dart';
import 'package:book_explorer/viewmodel/favourite_view_model.dart';
import 'package:book_explorer/viewmodel/login_view_model.dart';
import 'package:book_explorer/viewmodel/search_result_view_model.dart';
import 'package:book_explorer/viewmodel/setting_view_model.dart';
import 'package:book_explorer/viewmodel/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/local/dao/book_dao.dart';
import 'data/local/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final userDao = database.userDao;
  final bookDao = database.bookDao;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int? currentId = prefs.getInt("loginUserId");
  runApp(MyApp(
    userDao: userDao,
    bookDao: bookDao,
    currentId: currentId,
  ));
}

class MyApp extends StatelessWidget {
  UserDao userDao;
  BookDao bookDao;
  int? currentId;
  MyApp(
      {Key? key, required this.userDao, required this.bookDao, this.currentId})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchResultViewModel(bookDao)),
        ChangeNotifierProvider(create: (_) => SignUpViewModel(userDao)),
        ChangeNotifierProvider(create: (_) => LoginViewModel(userDao)),
        ChangeNotifierProvider(create: (_) => SettingViewModel(userDao)),
        ChangeNotifierProvider(create: (_) => FavouriteViewModel(bookDao))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: currentId != null ? SearchResultPage() : LoginPage(),
      ),
    );
  }
}
