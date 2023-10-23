import 'package:book_explorer/view/search_result_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/local/dao/user_dao.dart';
import '../model/user_vo.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserDao userDao;

  bool _loading = false;
  bool _isLoggedIn = false;

  ///Getter
  bool get loading => _loading;
  bool get isLoggedIn => _isLoggedIn;

  ///Setters
  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setIsLoggedIn(bool login) {
    _isLoggedIn = login;
    notifyListeners();
  }

  LoginViewModel(this.userDao) {}

  Future<UserVO?> login(BuildContext context) async {
    if (nameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setLoading(true);
      var result = await userDao.findUserByNameAndPassword(
          nameController.text, passwordController.text);
      if (result == null) {
        setIsLoggedIn(false);
        setLoading(false);
      } else {
        setIsLoggedIn(true);
        prefs.setInt("loginUserId", result.id ?? 0);
        setLoading(false);
      }
      clearInputs();
      return result;
    }
  }

  goToSearchPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => SearchResultPage()));
  }

  void clearInputs() {
    nameController.clear();
    passwordController.clear();
  }
}
