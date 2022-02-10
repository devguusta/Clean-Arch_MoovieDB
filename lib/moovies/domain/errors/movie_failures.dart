import '../../../core/error/failure.dart';

class NoDataFound extends Failure {
  NoDataFound({required String errorMessage, required exception})
      : super(
          errorMessage: 'No data founds',
          exception: exception,
        );
}

abstract class NoInternetConnection extends Failure {
  NoInternetConnection({required String errorMessage, required exception})
      : super(errorMessage: 'No internet connection', exception: exception);
}

class MovieNowPlayingNoInternetConnection extends NoInternetConnection {
  MovieNowPlayingNoInternetConnection(
      {required String errorMessage, required exception})
      : super(errorMessage: 'No internet connection', exception: exception);
}

class MovilePopularError extends Failure {
  MovilePopularError({required String errorMessage, required exception})
      : super(errorMessage: errorMessage, exception: exception);
}

class TrailerNoInternetConnection extends NoInternetConnection {
  TrailerNoInternetConnection(
      {required String errorMessage, required exception})
      : super(errorMessage: errorMessage, exception: exception);
}

class MovieUpComingNoInternetConnection extends NoInternetConnection {
  MovieUpComingNoInternetConnection(
      {required String errorMessage, required exception})
      : super(errorMessage: errorMessage, exception: exception);
}

class TraileError extends Failure {
  TraileError({required String errorMessage, required exception})
      : super(errorMessage: errorMessage, exception: exception);
}

class CrewNoInternetConnection extends NoInternetConnection {
  CrewNoInternetConnection({required String errorMessage, required exception})
      : super(errorMessage: errorMessage, exception: exception);
}

class CrewError extends Failure {
  CrewError({required String errorMessage, required exception})
      : super(errorMessage: errorMessage, exception: exception);
}
