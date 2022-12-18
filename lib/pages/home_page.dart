import 'package:flutter/material.dart';
import 'package:user_db_app/blocs/home_bloc.dart';
import 'package:user_db_app/data/vos/user_vo.dart';
import 'package:user_db_app/pages/user_detail_page.dart';
import 'package:user_db_app/resources/colors.dart';
import 'package:user_db_app/resources/dimens.dart';
import 'package:user_db_app/resources/strings.dart';
import 'package:user_db_app/utils/url_launch.dart';
import 'package:user_db_app/viewitems/user_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          centerTitle: true,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          title: const Text(
            APP_TITLE,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
              child: GestureDetector(
                onTap: () => launchThisUrl(MY_PROFILE_URL),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: Selector<HomeBloc, List<UserVO>>(
            selector: (context, bloc) => bloc.mUserList ?? [],
            builder: (context, userList, child) => (userList.isNotEmpty) ? ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_2,
                vertical: MARGIN_MEDIUM_2,
              ),
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToMovieDetailScreen(context, userList[index]);
                  },
                  child: UserView(userVo: userList[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return UserListDividerView();
              },
            ) : const Center(
              child: CircularProgressIndicator(color: USER_DETAIL_INFO_BACKGROUND_COLOR),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailScreen(BuildContext context, UserVO? userVo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailPage(userVo: userVo),
      ),
    );
  }
}

class UserListDividerView extends StatelessWidget {
  const UserListDividerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: MARGIN_CARD_MEDIUM_2),
        Divider(color: DIVIDER_COLOR),
        SizedBox(height: MARGIN_CARD_MEDIUM_2),
      ],
    );
  }
}
