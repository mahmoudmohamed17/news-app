import 'package:flutter/material.dart';
import 'package:news_app/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
      ),
      body: const ProfileViewBody(),
    );
  }
}

