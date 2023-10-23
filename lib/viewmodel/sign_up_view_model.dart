import 'package:flutter/cupertino.dart';

import '../data/local/dao/user_dao.dart';
import '../model/user_vo.dart';

class SignUpViewModel extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  bool _loading = false;
  bool _personExist = false;

  ///Getter
  bool get loading => _loading;
  bool get personExist => _personExist;

  final UserDao userDao;
  SignUpViewModel(this.userDao) {}

  bool checkPassword() {
    return passwordController.text == confirmController.text ? true : false;
  }
  bool checkTextField(){
    if(nameController.text.isEmpty || passwordController.text.isEmpty || confirmController.text.isEmpty){
      return false;
    }else{
      return true;
    }
  }

  signUp() async {
    setLoading(true);
    List<UserVO> userList = await userDao.findAllUsers();
    List<String> userName = userList.map((e) => e.name).toList();
    print(userName);
    if (userName.contains(nameController.text)) {
      setPersonExist(true);
      print("setperson exist :: $personExist");
    } else {
      userDao.insertPerson(UserVO(DateTime.now().millisecondsSinceEpoch,
          nameController.text, confirmController.text));
      setPersonExist(false);
      print("setperson exist :: $personExist");
    }

    setLoading(false);
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setPersonExist(bool value) {
    _personExist = value;
    notifyListeners();
  }
  void clearController(){
    nameController.clear();
    passwordController.clear();
    confirmController.clear();
  }
}
