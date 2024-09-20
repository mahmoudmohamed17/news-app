import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/core/styles/styles.dart';
import 'package:news_app/core/utilities/app_router.dart';
import 'package:news_app/core/utilities/functions/show_snack_bar.dart';
import 'package:news_app/core/utilities/service_locator.dart';
import 'package:news_app/core/widgets/app_logo.dart';
import 'package:news_app/core/widgets/custom_button.dart';
import 'package:news_app/core/widgets/custom_text_field.dart';
import 'package:news_app/features/auth/data/repos/auth_repo.dart';
import 'package:news_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:news_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:news_app/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:news_app/features/home/presentation/manager/news_cubit/news_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showSnackBar(context, state.message);
          GoRouter.of(context).push(AppRouter.kHomeView);
          formKey.currentState!.reset();
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errorMsg);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
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
                  height: 90,
                ),
                Text(
                  'Login',
                  style: Styles.textStyle32.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 42,
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
                      text: 'Login',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context)
                              .loginUser(email: email!, password: password!);
                          BlocProvider.of<NewsCubit>(context)
                              .getHeadlineNews(category: 'general');
                          var access = getIt.get<AuthRepo>();
                          userInfoModel =
                              await access.getUserData(email: email!);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 57,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: Styles.textStyle18.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        GoRouter.of(context).push(AppRouter.kSignupView);
                        formKey.currentState!.reset();
                      },
                      child: Text(
                        'Signup',
                        style: Styles.textStyle18.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.3,
                            decorationColor: Colors.white,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
