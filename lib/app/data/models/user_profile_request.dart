class UserProfileRequestModel {
  String email;
  String? password;
  String nome;
  String phone;

  UserProfileRequestModel({
    required this.email,
    this.password,
    required this.nome,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'telefone': phone,
        'email': email,
        if (password != null && password!.isNotEmpty) 'password': password,
      };

  // factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  //       name: json['nome'],
  //       email: json['email'],
  //       phone: json['telefone'],
  //     );
}
