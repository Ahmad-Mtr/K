import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/constants/assets_constants.dart';
import 'package:x_clone/features/tweet/widgets/tweet_list.dart';
import 'package:x_clone/features/explore/views/explore_view.dart';
import 'package:x_clone/theme/pallete.dart';

class UIconstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        colorFilter: ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn),
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static const List<Widget> bottomTabBarPages = [
    TweetList(),
    ExploreView(),
    Text('Notifications'),
  ];
}
