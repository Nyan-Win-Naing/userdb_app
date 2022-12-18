import 'package:flutter/foundation.dart';
import 'package:user_db_app/data/models/user_model.dart';
import 'package:user_db_app/data/models/user_model_impl.dart';
import 'package:user_db_app/data/vos/user_vo.dart';

class HomeBloc extends ChangeNotifier {
  /// States
  List<UserVO>? mUserList;

  /// Models
  UserModel mUserModel = UserModelImpl();

  HomeBloc() {
    /// Users From Database
    mUserModel.getUsersFromDatabase().listen((userList) {
      userList.sort((a, b) => (a.id ?? 0).compareTo(b.id ?? 0));
      mUserList = userList;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }
}