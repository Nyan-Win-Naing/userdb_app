import 'package:dio/dio.dart';
import 'package:user_db_app/data/vos/user_vo.dart';
import 'package:user_db_app/network/dataagents/user_data_agent.dart';
import 'package:user_db_app/network/the_user_db_api.dart';

class RetrofitDataAgentImpl extends UserDataAgent {

  late TheUserDbApi mApi;

  static final RetrofitDataAgentImpl _singleton = RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheUserDbApi(dio);
  }

  @override
  Future<List<UserVO>?> getUsers() {
    return mApi.getAllUsers();
  }

}