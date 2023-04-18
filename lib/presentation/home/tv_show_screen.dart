import 'package:flutter/material.dart';
import 'package:movie_app/presentation/setting/setting_screen.dart';
import 'package:movie_app/utils/app_constant.dart';
import 'package:movie_app/utils/navigation.dart';
import 'package:movie_app/utils/sizes.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(AppConstant.tvShow,
          style: TextStyle(
              fontSize: Sizes.dp18(context),
              fontWeight: FontWeight.w600
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () => _doNavigateToSettings(),
          )
        ],
      ),
    );
  }

  void _doNavigateToSettings() {
    Navigation.intent(context, SettingScreen.routeName);
  }

}