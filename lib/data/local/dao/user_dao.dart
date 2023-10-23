import 'package:floor/floor.dart';

import '../../../model/user_vo.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM UserVO')
  Future<List<UserVO>> findAllUsers();

  @Query('SELECT * FROM UserVO WHERE name = :name AND password = :password')
  Future<UserVO?> findUserByNameAndPassword(String name, String password);

  @insert
  Future<void> insertPerson(UserVO user);

  @delete
  Future<void> deletePerson(UserVO user);
}
