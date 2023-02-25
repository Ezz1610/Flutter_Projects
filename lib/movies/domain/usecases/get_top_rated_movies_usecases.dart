import '../entities/movies.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCases{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUseCases(this.baseMoviesRepository);

  Future<List<Movies>>execute()async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}