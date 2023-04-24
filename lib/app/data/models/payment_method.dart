class PaymentMethodModel {
  int id;
  String nome;

  PaymentMethodModel({
    required this.id,
    required this.nome,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        id: json['id'],
        nome: json['nome'],
      );
}
