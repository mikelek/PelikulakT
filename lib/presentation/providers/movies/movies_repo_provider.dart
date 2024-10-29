import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis/infrastructure/datasource/moviedb_datasource.dart';
import 'package:pelis/infrastructure/repositories/movie_repo_impl.dart';


// Este repositorio es inmutable (solo lectura)
final movieRepoProvider = Provider((ref) {

  return MovieRepoImpl(MoviedbDatasource());
});