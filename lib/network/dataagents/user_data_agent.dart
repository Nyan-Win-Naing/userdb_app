import 'package:user_db_app/data/vos/user_vo.dart';

abstract class UserDataAgent {
  Future<List<UserVO>?> getUsers();
}