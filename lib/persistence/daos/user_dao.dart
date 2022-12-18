import 'package:hive/hive.dart';
import 'package:user_db_app/data/vos/user_vo.dart';
import 'package:user_db_app/persistence/hive_constants.dart';

class UserDao {
  static final UserDao _singleton = UserDao._internal();

  factory UserDao() {
    return _singleton;
  }

  UserDao._internal();

  Box<UserVO> getUserBox() {
    return Hive.box<UserVO>(BOX_NAME_USER_VO);
  }

  void saveUsers(List<UserVO>? users) async {
    Map<int, UserVO> userMap = Map.fromIterable(
      users ?? [],
      key: (user) => user.id,
      value: (user) => user,
    );
    await getUserBox().putAll(userMap);
  }

  List<UserVO> getAllUsers() {
    return getUserBox().values.toList();
  }

  /// For Reactive with network & persistence
  Stream<void> getAllUsersEventStream() {
    return getUserBox().watch();
  }

  Stream<List<UserVO>> getAllUsersStream() {
    return Stream.value(getAllUsers());
  }

  List<UserVO> getUsersReactive() {
    if(getAllUsers() != null && getAllUsers().isNotEmpty) {
      return getAllUsers();
    } else {
      return [];
    }
  }
}
