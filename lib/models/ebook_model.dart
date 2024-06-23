class EbookModel {
  EbookModel({
    required this.titulo,
    required this.descricao,
    required this.urlImagem,
    required this.urlLivro,
    this.capitulos = const [],
  });

  late final String titulo;
  late final String? descricao;
  late final String urlImagem;
  late final String urlLivro;
  List<String> capitulos = [];
}
