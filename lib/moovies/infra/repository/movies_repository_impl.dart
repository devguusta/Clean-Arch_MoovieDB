import 'package:dartz/dartz.dart';
import 'package:mooviedb/core/error/failure.dart';
import 'package:mooviedb/moovies/domain/errors/movie_failures.dart';

import '../../domain/entities/movie.dart';
import '../../domain/infra/movies_repository.dart';
import '../datasources/movie_data_source.dart';

class MoviesRepositoryImplements implements MoviesRepository {
  final MovieDataSource dataSource;
  MoviesRepositoryImplements({
    required this.dataSource,
  });
  @override
  Future<Either<Failure, List<Movie>>> getMoviesPopular() async {
    try {
      var result = await dataSource.getMoviesPopular();
      if (result.isEmpty) {
        return Left(NoDataFound(
          errorMessage: "No data found",
          exception: null,
        ));
      }
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        UnknownError(
          exception: e.runtimeType,
          errorMessage: "Ocorreu um erro no servidor",
        ),
      );
    }
  }
}
