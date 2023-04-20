// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  int id;
  String nome;
  String unidadeMedida;
  String? descricao;
  String imagem;
  num preco;

  bool get isKG => unidadeMedida == 'KG';

  ProductModel({
    required this.id,
    required this.nome,
    required this.unidadeMedida,
    this.descricao,
    required this.imagem,
    required this.preco,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        nome: json['nome'],
        unidadeMedida: json['unidade'],
        descricao: json['descricao'],
        imagem: json['imagem'],
        preco: json['preco'],
      );
}
