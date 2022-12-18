import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_db_app/data/vos/user_vo.dart';
import 'package:user_db_app/network/api_constants.dart';

part 'the_user_db_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheUserDbApi {
  factory TheUserDbApi(Dio dio) = _TheUserDbApi;

  @GET(ENDPOINT_GET_USERS)
  Future<List<UserVO>> getAllUsers();
}