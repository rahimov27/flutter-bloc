part of 'dogs_bloc.dart';

@immutable
sealed class DogsEvent {}


class GetDogsEvent extends DogsEvent{}