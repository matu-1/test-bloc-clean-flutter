import 'package:test_bloc_arq/anime/model/anime.dart';
import 'package:test_bloc_arq/anime/repository/anime_dao.dart';

class AnimeRepository {
  final AnimeDao _animeDao = new AnimeDao();

  Future<List<Anime>> findAllDao() => _animeDao.findAll();
  
  Future<Anime> createDao(Anime anime) => _animeDao.create(anime);
}
