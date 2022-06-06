part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.theme});

  final ThemeData theme;

  ThemeState copyWith({ThemeData? theme}) => ThemeState(
        theme: theme ?? this.theme,
      );

  @override
  List<Object?> get props => [theme];
}
