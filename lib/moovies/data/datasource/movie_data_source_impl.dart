import 'package:dio/dio.dart';
import 'package:mooviedb/core/network/api/api_constants.dart';
import 'package:mooviedb/moovies/domain/entities/movie.dart';
import 'package:mooviedb/moovies/infra/datasources/movie_data_source.dart';

import '../../domain/errors/movie_failures.dart';
import '../mapper/movie_mapper.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final Dio dio;

  MovieDataSourceImpl({
    required this.dio,
  });
  @override
  Future<List<Movie>> getMoviesPopular() async {
    try {
      final response = await dio.get(
        'movies/popular',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'language': ApiConstants.language
        },
      );
      return MovieMapper.fromMapList(response.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw MoviePopularNoInternetConnection(
            errorMessage: "No internet connection", exception: e.type);
      } else if (e.type == DioErrorType.other) {
        throw MoviePopularNoInternetConnection(
            errorMessage: "No internet connection", exception: e.type);
      } else {
        throw MovilePopularError(
            errorMessage: "Ocorreu um erro no servidor", exception: null);
      }
    }
  }
}
