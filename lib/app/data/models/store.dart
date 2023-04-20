import 'package:app_hortifruti_pratico/app/data/models/categoria.dart';

class StoreModel {
  int id;
  String nome;
  String image;
  bool isOnline;
  List<CategoriaModel> categorias;

  StoreModel({
    required this.id,
    required this.nome,
    required this.image,
    required this.isOnline,
    required this.categorias,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json['id'],
        nome: json['nome'],
        image: json['logo'] ??
            'https://webevolui.com.br/principal/images/web-evolui-logo.png',
        isOnline: json['isOnline'] == 1,
        categorias: json['categorias'] == null
            ? []
            : List<CategoriaModel>.from(
                json['categorias']
                    .map((produtos) => CategoriaModel.fromJson(produtos)),
              ),
      );
}
