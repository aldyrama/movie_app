import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final bool themeState;

  const ThemeState({this.themeState = false});

  @override
  List<Object?> get props => [themeState];
}

class ThemeStateIdle extends ThemeState { }