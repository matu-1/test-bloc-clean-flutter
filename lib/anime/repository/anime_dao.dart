import 'package:test_bloc_arq/anime/model/anime.dart';
import 'package:test_bloc_arq/database/database.dart';

class AnimeDao {
  static const String TABLE = 'anime';
  DatabaseProvider _database = new DatabaseProvider();

  Future<List<Anime>> findAll() async {
    final db = await _database.db;
    return Anime.fromList(await db.query(TABLE));
  }

  Future<Anime> create(Anime anime) async {
    final db = await _database.db;
    anime.id = await db.insert(TABLE, anime.toJson());
    return anime;
  }
}
