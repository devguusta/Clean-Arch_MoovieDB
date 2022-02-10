import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mooviedb/moovies/data/datasource/movie_data_source_impl.dart';
import 'package:mooviedb/moovies/domain/entities/movie.dart';
import 'package:mooviedb/moovies/domain/infra/movies_repository.dart';
import 'package:mooviedb/moovies/domain/usecases/get_movie_popular.dart';
import 'package:mooviedb/moovies/infra/repository/movies_repository_impl.dart';

void main() {
  late GetMoviePopular useCase;
  late MoviesRepository repository;

  setUp(() {
    repository = MoviesRepositoryImplements(
      dataSource: MovieDataSourceImpl(
        dio: Dio(),
      ),
    );
    useCase = GetMoviePopular(
      repository: repository,
    );
  });

  test("Should if repositoryGetMovies return failure", () async {
    late List<Movie> expectResult;

    final result = await useCase.call();
    result.fold(
      (failure) => null,
      (movies) => expectResult = movies,
    );
    expect(expectResult, isNotNull);
  });
}
