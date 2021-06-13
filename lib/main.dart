import 'package:flutter/material.dart';
import 'package:test_bloc_arq/anime/ui/pages/anime_page.dart';
import 'package:test_bloc_arq/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test arq App',
      debugShowCheckedModeBanner: false,
      initialRoute: AnimePage.routeName,
      routes: routes,
      // theme:
      //     ThemeData.light().copyWith(textTheme: GoogleFonts.ralewayTextTheme()),
    );
  }
}
