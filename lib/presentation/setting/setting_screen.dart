import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/bloc.dart';
import 'package:movie_app/utils/sizes.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/utils/widget/items/setting_with_rb_item.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = '/setting';

  const SettingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingScreenState();

}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppConstant.settings,
          style: TextStyle(
              fontSize: Sizes.dp18(context),
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dp18(context),
        vertical: Sizes.dp16(context)
      ),
      child: BlocSelector<ThemeCubit, ThemeState, bool>(
        selector: (state) => state.themeState,
        builder: (context, state) {
          return SettingWithRbItem(
            title: 'Dark mode',
            value: state,
            onChanged: (value) => _doChangeTheme(value),
          );
        },
      ),
    );
  }

  void _doChangeTheme(bool isDarkTheme) {
    context.read<ThemeCubit>().setTheme(isDarkTheme: isDarkTheme);
  }

}