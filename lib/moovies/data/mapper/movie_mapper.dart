import '../../domain/entities/movie.dart';

class MovieMapper {
  static List<Movie> fromMapList(Map<String, dynamic> map) =>
      List<Movie>.from((map['results'] ?? []).map(MovieMapper.fromMap));

  static Movie fromMap(dynamic map) {
    return Movie(
      id: map['id'],
      title: map['title'] ?? map['name'],
      overview: map['overview'],
      releaseDate: map['release_date'] ?? 'No Release date',
      genreIds: List<int>.from(map['genre_ids'] ?? []),
      voteAverage: (map['vote_average'] as num).toDouble(),
      popularity: (map['popularity'] as num).toDouble(),
      posterPath:
          map['poster_path'] == null ? '' : map['poster_path'] as String,
      backdropPath: map['backdrop_path'] != null
          ? map['backdrop_path'] as String
          : map['poster_path'] == null
              ? ''
              : map['poster_path'] as String,
      tvName: map['tv_name'] ?? map['original_name'],
      tvRelease: map['tv_release'],
    );
  }
}
