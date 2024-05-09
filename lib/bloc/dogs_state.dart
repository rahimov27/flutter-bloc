part of 'dogs_bloc.dart';

@immutable
sealed class DogsState {}

final class DogsInitial extends DogsState {}

final class DogsLoading extends DogsState {}

final class DogsSuccess extends DogsState {
  final DogsModel model;
  DogsSuccess({required this.model});
}

final class DogsError extends DogsState {
  final String errorText;
  DogsError({required this.errorText});
}
