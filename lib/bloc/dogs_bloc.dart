import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dog_api_bl/models/dogs_model.dart';
import 'package:dog_api_bl/repositories/get_dogs_repository.dart';
import 'package:meta/meta.dart';

part 'dogs_event.dart';
part 'dogs_state.dart';

class DogsBloc extends Bloc<DogsEvent, DogsState> {
  DogsBloc({required this.repository}) : super(DogsInitial()) {
    on<GetDogsEvent>((event, emit) async {
      try {
        // First comes DogsLoading
        emit(DogsLoading());
        final model = await repository.getDogs();
        emit(DogsSuccess(model: model));
      } catch (e) {
        emit(DogsError(errorText: e.toString()));
      }
    });
  }
  final GetDogsRepository repository;
}
