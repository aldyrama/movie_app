import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/presentation/dashboard/dashboard_screen.dart';
import 'package:movie_app/utils/images_assets.dart';
import 'package:movie_app/utils/navigation.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              alignment: Alignment.center,
              width: 120,
              child: Lottie.asset(
                  ImagesAssets.movie
              ),
            ),
          )
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _doNavigationNextPage();
  }

  void _doNavigationNextPage() {
    Future.delayed(const Duration(seconds: 3), (){
      Navigation.intentWithClearAllRoutes(context, DashBoardScreen.routeName);
    });
  }

}