import 'package:dio/dio.dart';
import 'package:dog_api_bl/models/dogs_model.dart';

class GetDogsRepository {
  Future<DogsModel> getDogs() async {
    final Response response =
        await Dio().get("https://dog.ceo/api/breeds/image/random");

    // Second comes DogsSuccess
    return DogsModel.fromJson(response.data);
  }
}
