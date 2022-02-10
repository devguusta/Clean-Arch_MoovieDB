import 'package:dartz/dartz.dart';
import 'package:mooviedb/core/error/failure.dart';
import 'package:mooviedb/moovies/domain/entities/movie.dart';

import '../infra/movies_repository.dart';

abstract class IGetMoviePopular {
  Future<Either<Failure, List<Movie>>> call();
}

class GetMoviePopular implements IGetMoviePopular {
  final MoviesRepository repository;
  GetMoviePopular({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getMoviesPopular();
  }
}
