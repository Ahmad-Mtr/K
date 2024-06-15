import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/common/common.dart';
import 'package:x_clone/constants/assets_constants.dart';
import 'package:x_clone/features/auth/controller/auth_controller.dart';
import 'package:x_clone/features/user_profile/view/user_profile_view.dart';
import 'package:x_clone/theme/pallete.dart';

class SideDrawer extends ConsumerWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;

    return currentUser == null
        ? const Loader()
        : SafeArea(
            child: Drawer(
              backgroundColor: Pallete.backgroundColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      size: 30,
                    ),
                    title: const Text(
                      'My Profile',
                      style: TextStyle(fontSize: 22),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(UserProfileView.route(currentUser));
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      AssetsConstants.x,
                      width: 30,
                      height: 30,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    title: const GradientText(
                      style: TextStyle(fontSize: 22),
                      text: 'Premium',
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Pallete.blueColor,
                          Colors.transparent,
                          Pallete.whiteColor,
                        ], // Your desired colors
                      ),
                    ),
                    onTap: () {
                      // ref
                      //     .read(userProfileControllerProvider.notifier)
                      //     .updateUserProfile(
                      //       userModel: currentUser.copyWith(
                      //         isTwitterBlue: true,
                      //       ),
                      //       context: context,
                      //       bannerFile: null,
                      //       profileFile: null,
                      //     );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      size: 30,
                    ),
                    title: const Text(
                      'Log out',
                      style: TextStyle(fontSize: 22),
                    ),
                    onTap: () {
                      ref.read(authControllerProvider.notifier).logout(context);
                    },
                  ),
                ],
              ),
            ),
          );
  }
}

class GradientText extends StatelessWidget {
  const GradientText({
    Key? key,
    required this.text,
    this.style,
    required this.gradient,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
