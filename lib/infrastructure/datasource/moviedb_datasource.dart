import 'package:dio/dio.dart';
import 'package:pelis/config/constants/environment.dart';
import 'package:pelis/domain/datasources/movies_datasource.dart';
import 'package:pelis/domain/entities/movie.dart';
import 'package:pelis/infrastructure/mappers/movie_mapper.dart';
import 'package:pelis/infrastructure/models/models.dart';

class MoviedbDatasource extends MoviesDatasource{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-ES',
      'page':'1'
    }
  ));


  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    
    final movieDBResponse = MoviedDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
    // Si no tiene poster se descarta
    .where((movie) => movie.posterPath != 'no-poster')
    // Mapeamos el json recibido usando nuestra entidad
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
      ).toList();

    return movies;
  }
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing',
      queryParameters: {
        'page': page
      }
    );
    
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {

    final response = await dio.get('/movie/popular',
      queryParameters: {
        'page': page
      }
    );
    
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {

    final response = await dio.get('/movie/top_rated',
      queryParameters: {
        'page': page
      }
    );
    
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {

    final response = await dio.get('/movie/upcoming',
      queryParameters: {
        'page': page
      }
    );
    
    return _jsonToMovies(response.data);
    
  }
  
  @override
  Future<Movie> getMovieByID(String id) async {

    final response = await dio.get('/movie/$id');
    if(response.statusCode != 200) throw Exception('Movie with id: $id not found');

    final movieDetails = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }

}