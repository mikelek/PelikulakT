import 'package:dio/dio.dart';
import 'package:pelis/config/constants/environment.dart';
import 'package:pelis/domain/datasources/actors_datasource.dart';
import 'package:pelis/domain/entities/actor.dart';
import 'package:pelis/infrastructure/mappers/actor_mapper.dart';
import 'package:pelis/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource{

    final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-ES',
      'page':'1'
    }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = castResponse.cast
      .map((cast) => ActorMapper.castToEntity(cast)).toList();

      return actors;   
  }

}