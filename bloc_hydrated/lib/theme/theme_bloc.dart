import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ToggleThemeEvent>((event, emit) {
      emit(state.copyWith(
          appTheme: state.appTheme == AppTheme.light
              ? AppTheme.dark
              : AppTheme.light));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    print('Theme from storage: $json');
    final themeState = ThemeState.fromJson(json);
    print('ThemeState: $themeState');
    return themeState;
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    print('Theme to storage: $state');
    final themerJson = state.toJson();
    print('ThemeState: $themerJson');
    return themerJson;
  }
}
