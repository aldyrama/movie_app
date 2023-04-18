import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/bloc.dart';
import 'package:movie_app/bloc/movie/up_coming/movie_upcoming_cubit.dart';
import 'package:movie_app/core/network/api/dio_client.dart';
import 'package:movie_app/di/injection_container.dart';
import 'package:movie_app/presentation/dashboard/dashboard_screen.dart';
import 'package:movie_app/presentation/setting/setting_screen.dart';
import 'package:movie_app/presentation/splash/splash_screen.dart';
import 'package:movie_app/utils/styles/styles.dart';

import 'app_config.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => inject<ThemeCubit>(),
          ),
          BlocProvider(
            create: (context) => inject<MovieUpcomingCubit>(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: _buildWithTheme,
        )
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    context.read<ThemeCubit>().getTheme();
    print("check state : ${state.themeState}");
    return MaterialApp(
      title: Config.title,
      debugShowCheckedModeBanner: Config.isDebug,
      theme: state.themeState ? Themes.darkTheme : Themes.lightTheme,
      initialRoute: SplashScreen.routeName,
      // navigatorKey: DioClient.alice.getNavigatorKey(),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        DashBoardScreen.routeName: (context) => DashBoardScreen(title: Config.title),
        SettingScreen.routeName: (context) => const SettingScreen()
      },
    );
  }
}
