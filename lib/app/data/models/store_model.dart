class StoreModel {
  int id;
  String nome;
  String image;
  bool isOnline;

  StoreModel({
    required this.id,
    required this.nome,
    required this.image,
    required this.isOnline,
  });

  factory StoreModel.fromJson(Map<String, dynamic> map) => StoreModel(
        id: map['id'],
        nome: map['nome'],
        image: map['logo'] ??
            'https://webevolui.com.br/principal/images/web-evolui-logo.png',
        isOnline: map['isOnline'] == 1,
      );
}
