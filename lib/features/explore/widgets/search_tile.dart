import 'package:flutter/material.dart';
import 'package:x_clone/constants/assets_constants.dart';
import 'package:x_clone/features/user_profile/view/user_profile_view.dart';
import 'package:x_clone/models/user_model.dart';
import 'package:x_clone/theme/pallete.dart';

class SearchTile extends StatelessWidget {
  final UserModel userModel;
  const SearchTile({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, UserProfileView.route(userModel));
      },
      leading: CircleAvatar(
        backgroundImage: userModel.profilePic.isEmpty
            ? const NetworkImage(AssetsConstants.avtr)
            : NetworkImage(userModel.profilePic),
        radius: 30,
      ),
      title: Text(
        userModel.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '@${userModel.name}',
          style: const TextStyle(fontSize: 16, color: Pallete.greyColor),
        ),
        Text(
          userModel.bio,
          style: const TextStyle(
            color: Pallete.whiteColor,
          ),
        ),
      ]),
    );
  }
}
