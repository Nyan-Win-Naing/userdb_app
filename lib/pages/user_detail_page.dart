import 'package:flutter/material.dart';
import 'package:user_db_app/data/vos/address_vo.dart';
import 'package:user_db_app/data/vos/company_vo.dart';
import 'package:user_db_app/data/vos/user_vo.dart';
import 'package:user_db_app/resources/colors.dart';
import 'package:user_db_app/resources/dimens.dart';
import 'package:user_db_app/resources/strings.dart';
import 'package:user_db_app/utils/url_launch.dart';

class UserDetailPage extends StatelessWidget {
  final UserVO? userVo;

  UserDetailPage({required this.userVo});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final avatarRadius = screenHeight / 15;
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: PRIMARY_COLOR,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              userVo?.name ?? "",
            ),
            Text(
              userVo?.username ?? "",
              style: TextStyle(
                color: Colors.white70,
                fontSize: TEXT_13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MARGIN_LARGE),
              MainProfileInfoSectionView(
                  avatarRadius: avatarRadius, userVo: userVo),
              SizedBox(height: MARGIN_XLARGE),
              AddressSectionView(addressVo: userVo?.address),
              SizedBox(height: MARGIN_LARGE),
              WebsiteSectionView(webPageUrl: userVo?.website ?? ""),
              SizedBox(height: MARGIN_LARGE),
              CompanySectionView(companyVo: userVo?.company),
              SizedBox(height: MARGIN_XLARGE),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressSectionView extends StatelessWidget {
  final AddressVO? addressVo;

  AddressSectionView({required this.addressVo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: UserDetailTitleView(title: "Address", iconData: Icons.home),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          padding: EdgeInsets.symmetric(
            horizontal: MARGIN_CARD_MEDIUM_2,
            vertical: MARGIN_CARD_MEDIUM_2,
          ),
          decoration: BoxDecoration(
            color: USER_DETAIL_INFO_BACKGROUND_COLOR,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
          ),
          child: Column(
            children: [
              InfoRowView(label: "City", description: addressVo?.city ?? ""),
              SizedBox(height: MARGIN_MEDIUM_2),
              InfoRowView(
                  label: "Street", description: addressVo?.street ?? ""),
              SizedBox(height: MARGIN_MEDIUM_2),
              InfoRowView(label: "Suite", description: addressVo?.suite ?? ""),
              SizedBox(height: MARGIN_MEDIUM_2),
              InfoRowView(
                  label: "ZipCode", description: addressVo?.zipCode ?? ""),
            ],
          ),
        ),
      ],
    );
  }
}

class CompanySectionView extends StatelessWidget {
  final CompanyVO? companyVo;

  CompanySectionView({required this.companyVo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child:
              UserDetailTitleView(title: "Company", iconData: Icons.apartment),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          padding: EdgeInsets.symmetric(
            horizontal: MARGIN_CARD_MEDIUM_2,
            vertical: MARGIN_CARD_MEDIUM_2,
          ),
          decoration: BoxDecoration(
            color: USER_DETAIL_INFO_BACKGROUND_COLOR,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
          ),
          child: Column(
            children: [
              InfoRowView(label: "Name", description: companyVo?.name ?? ""),
              SizedBox(height: MARGIN_MEDIUM_2),
              InfoRowView(
                  label: "Catch Phrase",
                  description: companyVo?.catchPhrase ?? ""),
              SizedBox(height: MARGIN_MEDIUM_2),
              InfoRowView(label: "BS", description: companyVo?.bs ?? ""),
            ],
          ),
        ),
      ],
    );
  }
}

class WebsiteSectionView extends StatelessWidget {
  final String webPageUrl;

  WebsiteSectionView({required this.webPageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: UserDetailTitleView(
            title: "Website",
            iconData: Icons.web_outlined,
            isWeb: true,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          padding: EdgeInsets.symmetric(
            horizontal: MARGIN_CARD_MEDIUM_2,
            vertical: MARGIN_CARD_MEDIUM_2,
          ),
          decoration: BoxDecoration(
            color: USER_DETAIL_INFO_BACKGROUND_COLOR,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
          ),
          child: Column(
            children: [
              InfoRowView(label: "Website", description: webPageUrl),
            ],
          ),
        ),
      ],
    );
  }
}

class InfoRowView extends StatelessWidget {
  final String label;
  final String description;

  InfoRowView({required this.label, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 1 / 3,
          child: Text(
            "$label : ",
            style: TextStyle(
              color: Color.fromRGBO(41, 67, 78, 1.0),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Flexible(
          child: Text(
            description,
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class UserDetailTitleView extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool isWeb;

  UserDetailTitleView({
    required this.title,
    required this.iconData,
    this.isWeb = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: MARGIN_MEDIUM_3,
            ),
            SizedBox(width: MARGIN_MEDIUM),
            Text(
              title,
              style: TextStyle(
                color: Colors.white70,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Visibility(
          visible: isWeb,
          child: GestureDetector(
            onTap: () => launchThisUrl("https://google.com"),
            child: Text(
              "Lauch Web",
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MainProfileInfoSectionView extends StatelessWidget {
  const MainProfileInfoSectionView({
    Key? key,
    required this.avatarRadius,
    required this.userVo,
  }) : super(key: key);

  final double avatarRadius;
  final UserVO? userVo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: avatarRadius,
            backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
            backgroundImage: AssetImage(
              "assets/profile_placeholder.png",
            ),
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        UserInfoTextView(
          label: userVo?.name ?? "",
          color: HOME_SCREEN_PHONE_NUMBER_COLOR,
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: MARGIN_MEDIUM),
        UserInfoTextView(
          label: userVo?.phone ?? "",
          fontSize: TEXT_REGULAR,
          color: Colors.white70,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: MARGIN_MEDIUM),
        UserInfoTextView(
          label: userVo?.email ?? "",
          fontSize: TEXT_REGULAR,
          color: HOME_SCREEN_PHONE_NUMBER_COLOR,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}

class UserInfoTextView extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color color;
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
