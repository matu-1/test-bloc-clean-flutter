import 'package:flutter/material.dart';
import 'package:test_bloc_arq/anime/bloc/anime_bloc.dart';
import 'package:test_bloc_arq/anime/model/anime.dart';
import 'package:test_bloc_arq/constants/ui.dart';

class AnimeRePage extends StatelessWidget {
  static final routeName = 'animere';
  final _animeBloc = new AnimeBloc();

  @override
  Widget build(BuildContext context) {
    _animeBloc.findAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime re'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _animeBloc.create(new Anime(
                  nombre: 'ichigo',
                  descripcion:
                      'Ichigo Kurosaki es un adolescente japonés aparentemente ordinario que tiene la facultad de interactuar con los espíritus.2​ Una noche, Ichigo se topa con un ente que no había conocido antes una shinigami —personificación japonesa del Dios de la muerte',
                  fechaExtreno: '2020-05-05',
                ));
              }),
        ],
      ),
      body: _getAnimes(),
    );
  }

  Widget _getAnimes() {
    return StreamBuilder(
      stream: _animeBloc.animesStream,
      builder: (BuildContext context, AsyncSnapshot<List<Anime>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isEmpty)
            return Center(
              child: Text('No Data'),
            );
          return _animeList(snapshot.data);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _animeList(List<Anime> animes) {
    return ListView.builder(
      itemCount: animes.length,
      itemBuilder: (BuildContext context, int index) {
        return _animeBox(animes[index]);
      },
    );
  }

  Widget _animeBox(Anime anime) {
    return Container(
      padding: EdgeInsets.all(UI.padding),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(anime.getInitialName()),
          ),
          SizedBox(
            width: UI.separator,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(anime.nombre,
                    style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                Text(anime.descripcion),
              ],
            ),
          )
        ],
      ),
    );
  }
}
