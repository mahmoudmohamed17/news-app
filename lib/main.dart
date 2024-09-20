import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/core/utilities/app_router.dart';
import 'package:news_app/core/utilities/service_locator.dart';
import 'package:news_app/features/home/data/repos/home_repo_impl.dart';
import 'package:news_app/features/home/presentation/manager/news_cubit/news_cubit.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('emailIdBox');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(HomeRepoImpl()),
      child: MaterialApp.router(
        theme: ThemeData(
          textTheme: GoogleFonts.karlaTextTheme(ThemeData.light().textTheme),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
