import 'package:flutter/material.dart';
import 'package:user_db_app/pages/user_detail_page.dart';
import 'package:user_db_app/resources/colors.dart';
import 'package:user_db_app/resources/dimens.dart';
import 'package:user_db_app/resources/strings.dart';
import 'package:user_db_app/viewitems/user_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2,
            vertical: MARGIN_MEDIUM_2,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _navigateToMovieDetailScreen(context);
              },
              child: UserView(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return UserListDividerView();
          },
        ),
      ),
    );
  }

  void _navigateToMovieDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailPage(),
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
