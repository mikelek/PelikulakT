import 'package:pelis/domain/entities/actor.dart';

abstract class ActorsRepository {
  
  Future<List<Actor>> getActorsByMovie(String movieId);
}