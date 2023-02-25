import 'package:movies_app/movies/data/model/movies_model.dart';

import '../entities/movies.dart';

abstract class BaseMoviesRepository{
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();

}
