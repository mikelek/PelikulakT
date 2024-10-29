import 'package:pelis/domain/datasources/movies_datasource.dart';
import 'package:pelis/domain/entities/movie.dart';
import 'package:pelis/domain/repositories/movies_repository.dart';

class MovieRepoImpl extends MoviesRepository {

  final MoviesDatasource datasource;
  MovieRepoImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }
  
  @override
  Future<Movie> getMovieByID(String id) {
    return datasource.getMovieByID(id);
  }
  
}