import 'package:bloc/bloc.dart';
import 'package:movie_app/core/local/shared_pref_helper.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPrefHelper prefHelper;

  ThemeCubit({required this.prefHelper}): super(ThemeStateIdle());

  setTheme({bool isDarkTheme = false}) {
    prefHelper.saveValueDarkTheme(isDarkTheme);
    getTheme();
  }

  getTheme() async{
    var isDarkTheme = await prefHelper.getValueDarkTheme();
    print("check theme active : $isDarkTheme");
    emit(ThemeState(themeState: isDarkTheme));
  }
}