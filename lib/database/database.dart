import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static final _instance = new DatabaseProvider._internal();
  Database _db;

  DatabaseProvider._internal();
  factory DatabaseProvider() => _instance;

  Future<Database> init() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    return openDatabase(join(path, 'dbanime2'), version: 1,
        onCreate: (db, version) async {
      final batch = db.batch();
      batch.execute('''
        create table categoria (
          id integer not null,
          nombre text not null,
          primary key(id)
        );
      ''');
      batch.execute('''
        create table anime (
          id integer not null,
          nombre text not null,
          descripcion text not null,
          fecha_extreno text not null,
          categoria_id text,
          primary key(id),
          foreign key(categoria_id) references categoria(id)
        );
      ''');
      await batch.commit(noResult: true);
    });
  }

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await init();
    return _db;
  }
}
