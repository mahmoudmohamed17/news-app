import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utilities/assets_data.dart';
import 'package:news_app/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:news_app/features/profile/presentation/views/widgets/custom_data_field.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          ClipRRect(
            child: CircleAvatar(
              radius: 77,
              backgroundColor: kPrimaryColor,
              child: ClipRRect
              (
                borderRadius: BorderRadius.circular(77),
                child: const Image(
                  // fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                  image: AssetImage(AssetsData.accountImage)),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomDataField(value: userInfoModel!.name, label: 'Name'),
          CustomDataField(value: userInfoModel!.phone, label: 'Phone'),
          CustomDataField(value: userInfoModel!.email, label: 'Email'),
          CustomDataField(value: userInfoModel!.password, label: 'Password'),
        ],
      ),
    );
  }
}
