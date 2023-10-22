import 'package:flutter/cupertino.dart';

import '../data/local/dao/user_dao.dart';
import '../model/user_vo.dart';

class SignUpViewModel extends ChangeNotifier{
  bool _loading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  bool get loading=>_loading;

  final UserDao userDao;
  SignUpViewModel(this.userDao){}

  signUp(){
    setLoading(true);
   var result =  userDao.insertPerson(UserVO(DateTime.now().millisecondsSinceEpoch,nameController.text,confirmController.text));
   print("Result :: $result");
   setLoading(false);

  }
  setLoading(bool loading){
    _loading = loading;
    notifyListeners();
  }
}