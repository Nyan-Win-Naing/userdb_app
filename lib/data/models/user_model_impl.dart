import 'package:stream_transform/stream_transform.dart';
import 'package:user_db_app/data/models/user_model.dart';
import 'package:user_db_app/data/vos/user_vo.dart';
import 'package:user_db_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:user_db_app/network/dataagents/user_data_agent.dart';
import 'package:user_db_app/persistence/daos/user_dao.dart';

class UserModelImpl extends UserModel {

  static final UserModelImpl _singleton = UserModelImpl._internal();

  factory UserModelImpl() {
    return _singleton;
  }

  UserModelImpl._internal();

  /// Data Agent
  UserDataAgent mDataAgent = RetrofitDataAgentImpl();

  /// Daos
  UserDao mUserDao = UserDao();

  /// Network
  @override
  void getUsers() {
    mDataAgent.getUsers().then((users) async {
      mUserDao.saveUsers(users ?? []);
    });
  }

  /// Database
  // getUsers from network and sync with persistence
  @override
  Stream<List<UserVO>> getUsersFromDatabase() {
    getUsers();
    return mUserDao
        .getAllUsersEventStream()
        .startWith(mUserDao.getAllUsersStream())
        .map((event) => mUserDao.getUsersReactive());
  }

}