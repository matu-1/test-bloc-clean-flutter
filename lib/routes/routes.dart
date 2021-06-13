import 'package:flutter/material.dart' show WidgetBuilder;
import 'package:test_bloc_arq/anime/ui/pages/anime_create_page.dart';
import 'package:test_bloc_arq/anime/ui/pages/anime_page.dart';
import 'package:test_bloc_arq/anime/ui/pages/anime_re_page.dart';

Map<String, WidgetBuilder> routes = {
  AnimePage.routeName: (_) => AnimePage(),
  AnimeCreatePage.routeName: (_) => AnimeCreatePage(),
  AnimeRePage.routeName: (_) => AnimeRePage(),
};
