import 'package:dartz/dartz.dart';
import 'package:movie_app/core/apis/home_api_service.dart';
import 'package:movie_app/core/models/movie_response_model.dart';
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/networking/error_handler.dart';

class HomeRepo {
  final HomeApiService apiService;

  HomeRepo(this.apiService);

  Future<ApiResult<MoviesResponseModel>> getMovies() async {
    try {
      final response = await apiService.getMovies();
      return Right(response);
    } catch (error) {
      final failure = ErrorHandler.handleError(error);
      return Left(failure);
    }
  }
}
