import 'package:floor/floor.dart';

@entity
class UserVO{
  @primaryKey
  int? id;

  String name;
  String password;
  UserVO(this.id, this.name, this.password);
}