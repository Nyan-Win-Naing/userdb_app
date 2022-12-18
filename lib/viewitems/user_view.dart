import 'package:flutter/material.dart';
import 'package:user_db_app/resources/colors.dart';
import 'package:user_db_app/resources/dimens.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileInfoView(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 2 / 3,
      child: Row(
        children: [
          ProfileImageView(),
          SizedBox(width: MARGIN_CARD_MEDIUM_2),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoTextView(
                  label: "Leanne Graham",
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: MARGIN_MEDIUM),
                UserInfoTextView(
                  label: "1-770-736-8031 x56442",
                  color: HOME_SCREEN_PHONE_NUMBER_COLOR,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: MARGIN_MEDIUM),
                UserInfoTextView(
                  label: "Sincere@april.biz",
                  color: Colors.white70,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserInfoTextView extends StatelessWidget {
  final String label;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  UserInfoTextView({
    required this.label,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.height / 25,
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      backgroundImage: AssetImage(
        "assets/profile_placeholder.png",
      ),
    );
  }
}
