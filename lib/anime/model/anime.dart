class Anime {
  int id;
  String nombre;
  String descripcion;
  String fechaExtreno;
  String categoriaId;

  Anime({
    this.id,
    this.nombre,
    this.descripcion,
    this.fechaExtreno,
    this.categoriaId,
  });

  factory Anime.fromMap(Map map) => new Anime(
        id: map['id'],
        nombre: map['nombre'],
        descripcion: map['descripcion'],
        fechaExtreno: map['fecha_extreno'],
        categoriaId: map['categoria_id'],
      );
  static List<Anime> fromList(List list) =>
      list.map((e) => new Anime.fromMap(e)).toList();

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'descripcion': descripcion,
        'fecha_extreno': fechaExtreno,
        'categoria_id': categoriaId,
      };
  String getInitialName() => this.nombre[0].toUpperCase();
}
