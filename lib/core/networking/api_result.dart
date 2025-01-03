import 'package:movie_app/core/networking/failure.dart';
import 'package:dartz/dartz.dart';

typedef ApiResult<T> = Either<Failure, T>;
