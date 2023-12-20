import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeState.initial());

  // switch method to change the theme
  void switchTheme() {
    // if the current theme is light, switch to dark
    if (state.themeModeState == ThemeMode.light) {
      emit(state.copyWith(themeModeState: ThemeMode.dark));
    } else {
      // if the current theme is dark, switch to light
      emit(state.copyWith(themeModeState: ThemeMode.light));
    }
  }
}
