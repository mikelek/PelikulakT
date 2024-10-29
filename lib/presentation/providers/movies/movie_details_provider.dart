import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis/domain/entities/movie.dart';
import 'package:pelis/presentation/providers/providers.dart';


final movieDetailsProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {

  final movieRepository = ref.watch(movieRepoProvider).getMovieByID;

  return MovieMapNotifier(getMovie: movieRepository);
});


typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

    final GetMovieCallback getMovie;

    MovieMapNotifier({
        required this.getMovie
    }): super({});

    Future<void> loadMovie(String movieId) async {
        if(state[movieId] != null) return;

        final movie = await getMovie(movieId);
        state = { ...state, movieId: movie};
    }
}