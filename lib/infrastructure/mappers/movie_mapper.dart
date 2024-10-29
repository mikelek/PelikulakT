import 'package:pelis/domain/entities/movie.dart';
import 'package:pelis/infrastructure/models/models.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDb moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: moviedb.backdropPath != ''
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        : 'https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: moviedb.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        : 'no-poster',
      //  : 'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
    );

    static Movie movieDetailsToEntity(MovieDetails movieDetails) => Movie(
      adult: movieDetails.adult,
      backdropPath: movieDetails.backdropPath != ''
        ? 'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}'
        : 'movieDetails://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
      genreIds: movieDetails.genres.map((e) => e.name).toList(),
      id: movieDetails.id,
      originalLanguage: movieDetails.originalLanguage,
      originalTitle: movieDetails.originalTitle,
      overview: movieDetails.overview,
      popularity: movieDetails.popularity,
      posterPath: movieDetails.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}'
        : 'movieDetails://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
      //  movieDetails 'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg',
      releaseDate: movieDetails.releaseDate,
      title: movieDetails.title,
      video: movieDetails.video,
      voteAverage: movieDetails.voteAverage,
      voteCount: movieDetails.voteCount 
    );
}
