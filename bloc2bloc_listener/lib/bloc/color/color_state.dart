part of 'color_bloc.dart';

class ColorState {
  final Color color;

  ColorState({
    required this.color,
  });

  factory ColorState.initial() {
    return ColorState(color: Colors.red);
  }

  @override
  List<Object> get props => [color];

  @override
  String toString() {
    return 'ColorState{color: $color}';
  }

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }
}
