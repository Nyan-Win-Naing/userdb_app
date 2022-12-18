import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:user_db_app/data/vos/address_vo.dart';
import 'package:user_db_app/data/vos/company_vo.dart';
import 'package:user_db_app/data/vos/geo_vo.dart';
import 'package:user_db_app/data/vos/user_vo.dart';
import 'package:user_db_app/pages/home_page.dart';
import 'package:user_db_app/persistence/hive_constants.dart';
import 'package:user_db_app/resources/colors.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(AddressVOAdapter());
  Hive.registerAdapter(CompanyVOAdapter());
  Hive.registerAdapter(GeoVOAdapter());
  Hive.registerAdapter(UserVOAdapter());

  await Hive.openBox<UserVO>(BOX_NAME_USER_VO);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
