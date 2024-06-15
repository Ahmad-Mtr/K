import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:x_clone/features/home/widget/side_drawer.dart';
import 'package:x_clone/features/tweet/view/create_tweet_view.dart';
import 'package:x_clone/theme/theme.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;
  final appBar = UIconstants.appBar();
  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  onCreateTweet() {
    Navigator.push(context, CreateTweetView.route());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: _page == 0 ? appBar : null,
      body: IndexedStack(
        index: _page,
        children: UIconstants.bottomTabBarPages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onCreateTweet,
        backgroundColor: Colors.transparent,
        child: Container(
          width: 56.0, // Size of the FAB
          height: 56.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // Make it circular
            gradient: LinearGradient(
              colors: [
                Pallete.blueColor,
                Colors.transparent,
                Pallete.blueColor,
                Pallete.whiteColor,
              ], // Your desired colors
              begin: Alignment.topLeft, // Gradient direction
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(
            Icons.add_outlined,
            color: Colors.white,
          ), // Your icon
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _page,
        onTap: onPageChange,
        backgroundColor: Pallete.backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _page == 0
                  ? AssetsConstants.homeFilledIcon
                  : AssetsConstants.homeOutlinedIcon,
              colorFilter: const ColorFilter.mode(
                Pallete.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.searchIcon,
              colorFilter: const ColorFilter.mode(
                Pallete.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _page == 2
                  ? AssetsConstants.notifFilledIcon
                  : AssetsConstants.notifOutlinedIcon,
              colorFilter: const ColorFilter.mode(
                Pallete.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
