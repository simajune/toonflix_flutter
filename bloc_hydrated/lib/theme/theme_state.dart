part of 'theme_bloc.dart';

enum AppTheme {
  light,
  dark;

  String toJson() => name;

  static AppTheme fromJson(String json) => values.byName(json);
}

class ThemeState {
  final AppTheme appTheme;

  ThemeState({
    this.appTheme = AppTheme.light,
  });

  factory ThemeState.initial() {
    return ThemeState();
  }

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() {
    return 'ThemeState(themeState: $appTheme)';
  }

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      appTheme: AppTheme.fromJson(json["appTheme"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "appTheme": appTheme,
    };
  }
}
