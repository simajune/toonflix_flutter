part of 'theme_bloc.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeState {
  final AppTheme appTheme;

  factory ThemeState.initial() {
    return ThemeState();
  }

  ThemeState({
    this.appTheme = AppTheme.light,
  });

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() {
    return 'ThemeState{appTheme: $appTheme}';
  }

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
