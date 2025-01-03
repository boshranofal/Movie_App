part of 'home_cubit.dart';
 class HomeState {}

final class HomeInitial extends HomeState {}

final class GetMoviesLoading extends HomeState {}

final class GetMoviesSuccess extends HomeState {
  final MoviesResponseModel movies;

  GetMoviesSuccess(this.movies);
}

final class GetMoviesFailure extends HomeState {
  final Failure failure;

  GetMoviesFailure(this.failure);
}
