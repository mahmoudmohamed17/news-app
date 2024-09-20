import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:news_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:news_app/features/auth/presentation/views/login_view.dart';
import 'package:news_app/features/auth/presentation/views/signup_view.dart';
import 'package:news_app/features/home/presentation/views/article_details_view.dart';
import 'package:news_app/features/home/presentation/views/home_view.dart';
import 'package:news_app/features/profile/presentation/views/profile_view.dart';
import 'package:news_app/features/search/presentation/views/search_view.dart';
import 'package:news_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kSignupView = '/signupView';
  static const kHomeView = '/homeView';
  static const kArticleDetailsView = '/articleDetailsView';
  static const kProfileView = '/profileView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
              create: (context) => AuthCubit(AuthRepoImpl()),
              child: const LoginView(),
            )),
    GoRoute(
      path: kSignupView,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(AuthRepoImpl()),
        child: const SignupView(),
      ),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kArticleDetailsView,
      builder: (context, state) => const ArticleDetailsView(),
    ),
    GoRoute(
      path: kProfileView,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
