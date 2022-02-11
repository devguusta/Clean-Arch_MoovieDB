import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mooviedb/core/error/failure.dart';
import 'package:mooviedb/moovies/domain/entities/movie.dart';
import 'package:mooviedb/moovies/domain/errors/movie_failures.dart';
import 'package:mooviedb/moovies/domain/infra/movies_repository.dart';
import 'package:mooviedb/moovies/domain/usecases/get_movie_popular.dart';

import 'get_movie_popular_test.mocks.dart';

@GenerateMocks([MoviesRepository])
void main() {
  late GetMoviePopular useCase;
  late MoviesRepository repository;

  setUp(() {
    repository = MockMoviesRepository();
    useCase = GetMoviePopular(
      repository: repository,
    );
  });

  test("Should if repositoryGetMovies return a movie entit from the repository",
      () async {
    List<Movie> expectResult = [
      Movie(
          id: 1,
          title: "title",
          overview: "overview",
          releaseDate: "releaseDate",
          genreIds: [1, 2, 5],
          voteAverage: 5.0,
          popularity: 8.0,
          posterPath: "posterPath",
          backdropPath: "backdropPath")
    ];
    when(repository.getMoviesPopular())
        .thenAnswer((_) async => Right<Failure, List<Movie>>(expectResult));
    final result = await useCase.call();
    expect(result, Right(expectResult));
    verify(repository.getMoviesPopular()).called(1);
  });

  test("Should return a MoviePopularError when don't success", () async {
    when(repository.getMoviesPopular()).thenAnswer(
      (_) async => Left<Failure, List<Movie>>(
        MovilePopularError(
            errorMessage: "Ocorreu um erro interno no servidor",
            exception: Failure),
      ),
    );
    final result = await useCase.call();

    result.fold(
      (l) => expect(l, isInstanceOf<MovilePopularError>()),
      (r) => expect(r, null),
    );
    verify(repository.getMoviesPopular()).called(1);
  });
}
