import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooviedb/moovies/domain/usecases/get_movie_popular.dart';
import 'package:mooviedb/moovies/presenter/movies_event.dart';

import '../movies_state.dart';

class MovieController extends Bloc<MovieEvent, MovieState> {
  final GetMoviePopular getMoviePopular;
  MovieController(
    this.getMoviePopular,
  ) : super(MovieInitial()) {
    on<GetMovieEvent>((event, emit) async {
      emit(MovieLoading());
      final result = await getMoviePopular.call();
      result.fold((l) => emit(MovieError()), (r) {
        emit(MovieLoaded(r));
      });
    });
  }
}
