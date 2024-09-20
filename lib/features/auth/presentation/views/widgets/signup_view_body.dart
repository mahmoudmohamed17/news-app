import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/core/styles/styles.dart';
import 'package:news_app/core/utilities/functions/show_snack_bar.dart';
import 'package:news_app/core/utilities/service_locator.dart';
import 'package:news_app/core/widgets/app_logo.dart';
import 'package:news_app/core/widgets/custom_button.dart';
import 'package:news_app/core/widgets/custom_text_field.dart';
import 'package:news_app/features/auth/data/repos/auth_repo.dart';
import 'package:news_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:news_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:news_app/features/profile/data/models/user_info_model.dart';

UserInfoModel? userInfoModel;

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, phone, name;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          showSnackBar(context, state.message);
          GoRouter.of(context).pop();
        } else if (state is SignupFailure) {
          showSnackBar(context, state.errorMsg);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              children: [
                const SizedBox(
                  height: 35,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(),
                  ],
                ),
                const SizedBox(
                  height: 51,
                ),
                Text(
                  'Signup',
                  style: Styles.textStyle32.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 42,
                ),
                CustomTextFormField(
                  hintText: 'Name',
                  icon: Icons.person,
                  onFieldSubmitted: (value) {
                    name = value;
                  },
                ),
                const SizedBox(
                  height: 19,
                ),
                CustomTextFormField(
                  hintText: 'Phone',
                  icon: Icons.phone,
                  textInputType: TextInputType.phone,
                  onFieldSubmitted: (value) {
                    phone = value;
                  },
                ),
                const SizedBox(
                  height: 19,
                ),
                CustomTextFormField(
                  hintText: 'Email',
                  icon: Icons.email,
                  onFieldSubmitted: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 19,
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  onFieldSubmitted: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 42,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: 'Signup',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context)
                              .signupUser(email: email!, password: password!);
                          var access = getIt.get<AuthRepo>();
                          await access.storeUserData(
                              email: email!,
                              password: password!,
                              name: name!,
                              phone: phone!);
                        
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 57,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
