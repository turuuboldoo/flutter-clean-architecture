import 'package:app/features/home/data/source/remote/dto/user_dto.dart';
import 'package:app/util/const/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.appBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('users')
  Future<HttpResponse<List<UserDto>>> getUsersFromApi();
}
