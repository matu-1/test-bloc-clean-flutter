import 'package:flutter/material.dart';
import 'package:test_bloc_arq/anime/bloc/anime_bloc.dart';
import 'package:test_bloc_arq/anime/model/anime.dart';
import 'package:test_bloc_arq/anime/ui/pages/anime_re_page.dart';
import 'package:test_bloc_arq/constants/ui.dart';

class AnimePage extends StatelessWidget {
  static final routeName = 'anime';
  final _animeBloc = new AnimeBloc();

  @override
  Widget build(BuildContext context) {
    _animeBloc.findAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _animeBloc.create(new Anime(
                  nombre: 'naruto',
                  descripcion:
                      'Naruto tiene un gran número de personajes que, en su mayoría, se distinguen por ser ninjas. Al principio estudian en la Academia Ninja, para luego ser divididos en tríos Genin (grupo de ninjas novatos),',
                  fechaExtreno: '2020-05-05',
                ));
              }),
          IconButton(
              icon: Icon(Icons.next_plan),
              onPressed: () =>
                  Navigator.of(context).pushNamed(AnimeRePage.routeName))
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
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
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
