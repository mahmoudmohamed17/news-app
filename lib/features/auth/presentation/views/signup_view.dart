import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SignupViewBody(),
    );
  }
}
