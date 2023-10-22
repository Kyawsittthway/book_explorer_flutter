import 'package:floor/floor.dart';

import '../../../model/user_vo.dart';

@dao
abstract class UserDao{
  

  @Query('SELECT * FROM Person WHERE name = :name AND password = :password')
  Stream<UserVO?> findUserByNameAndPassword(String name,String password);

  @insert
  Future<void> insertPerson(UserVO user);
  
  @delete
  Future<void>deletePerson(UserVO user);
}