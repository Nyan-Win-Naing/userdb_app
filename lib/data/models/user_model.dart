import 'package:user_db_app/data/vos/user_vo.dart';

abstract class UserModel {
  /// Network
  void getUsers();

  /// Database
  Stream<List<UserVO>> getUsersFromDatabase();
}