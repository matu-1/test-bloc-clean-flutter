import 'dart:async';

import 'package:test_bloc_arq/anime/model/anime.dart';
import 'package:test_bloc_arq/anime/repository/anime_repository.dart';

enum State {
  test,
}

class AnimeBloc {
  static final AnimeBloc _instance = new AnimeBloc._internal();
  final _streamControllerAnimes = new StreamController<List<Anime>>.broadcast();
  final _animeRepository = new AnimeRepository();
  var test = State.test;

  AnimeBloc._internal();
  factory AnimeBloc() => _instance;

  void disponse() => _streamControllerAnimes?.close();

  Stream<List<Anime>> get animesStream => _streamControllerAnimes.stream;

  set animeChange(List<Anime> animes) {
    _streamControllerAnimes.sink.add(animes);
  }

  Future<List<Anime>> findAll() async {
    try {
      final res = await _animeRepository.findAllDao();
      animeChange = res;
      return res;
    } catch (e) {
      _streamControllerAnimes.sink.addError(e);
      throw new Exception(e.message);
    }
  }

  Future<Anime> create(Anime anime) async {
    try {
      final res = await _animeRepository.createDao(anime);
      findAll();
      return res;
    } catch (e) {
      _streamControllerAnimes.sink.addError(e);
      throw new Exception(e.message);
    }
  }
}
