// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_hortifruti_pratico/app/data/models/produto.dart';

class CategoriaModel {
  int id;
  String nome;
  List<ProductModel> produtos;

  CategoriaModel({
    required this.id,
    required this.nome,
    required this.produtos,
  });

  factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
        id: json['id'],
        nome: json['nome'],
        produtos: json['produtos'] == null
            ? []
            : List<ProductModel>.from(
                json['produtos']
                    .map((produtos) => ProductModel.fromJson(produtos)),
              ),
      );
}
