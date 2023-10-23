import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/local/dao/user_dao.dart';
import '../model/user_vo.dart';

class SettingViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserDao userDao;

  SettingViewModel(this.userDao);
  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  logOut() async {
    setIsLoading(true);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? currentId = prefs.getInt("loginUserId");
    print("Current user id :: $currentId");
    await prefs.remove("loginUserId");

    setIsLoading(false);
  }

  removeUser() async {
    setIsLoading(true);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? currentId = prefs.getInt("loginUserId");
    List<UserVO> userList = await userDao.findAllUsers();
    var user = userList.where((element) => element.id == currentId);
    // print("user :: ${user.first.id}");
    userDao.deletePerson(user.first);
    setIsLoading(false);
    // userDao.deletePerson(user);
  }
}
