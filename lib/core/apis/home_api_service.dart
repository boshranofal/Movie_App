import 'package:dio/dio.dart';
import 'package:movie_app/core/models/movie_response_model.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(ApiConstants.discoverMovies)
  Future<MoviesResponseModel> getMovies();
}
