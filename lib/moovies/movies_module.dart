import 'package:flutter_modular/flutter_modular.dart';
import 'package:mooviedb/moovies/data/datasource/movie_data_source_impl.dart';
import 'package:mooviedb/moovies/domain/infra/movies_repository.dart';
import 'package:mooviedb/moovies/domain/usecases/get_movie_popular.dart';
import 'package:mooviedb/moovies/infra/datasources/movie_data_source.dart';
import 'package:mooviedb/moovies/infra/repository/movies_repository_impl.dart';
import 'package:mooviedb/moovies/presenter/controllers/movies_controller.dart';
import 'package:mooviedb/moovies/presenter/movies_page.dart';

class MovieModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MovieController(i()), export: true),

    Bind.lazySingleton((i) => GetMoviePopular(repository: i.get())),

    ///
    /// DataSources
    ///
    ///

    //Datasources
    Bind.lazySingleton<MovieDataSource>((i) => MovieDataSourceImpl(dio: i()),
        export: true),
    //repositories
    Bind.lazySingleton<MoviesRepository>(
        (i) => MoviesRepositoryImplements(dataSource: i()),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MoviesPage()),
  ];
}
