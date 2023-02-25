import 'package:movies_app/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/movies/data/model/movies_model.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository{
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;
  MoviesRepository(this.baseMoviesRemoteDataSource);
  @override
  Future<List<MoviesModel>> getNowPlayingMovies()async {
    return await baseMoviesRemoteDataSource.getNowPlayingMovies() ;
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

}