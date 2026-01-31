import 'dart:convert';
import 'dart:io';

class Cadastro {
  String? nome, senha, email;

  Cadastro({required this.nome, required this.senha, required this.email});

  factory Cadastro.fromJson(Map<String, dynamic> json) {
    return Cadastro(
      nome: json['nome'],
      senha: json['senha'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'nome': nome, 'senha': senha, 'email': email};
  }
}

int i = 1;
List penis = [];
var arqu = File("lista.json");
void main() async {
  String conteudo = await arqu.readAsString();
  List<dynamic> lista = jsonDecode(conteudo);

  var no = lista[0][0];
  print("bem vindo ${no['nome']} \n bora fazer outro cadastro!");

  print("nome: ");
  var nome = stdin.readLineSync();

  print("senha: ");
  var senh = stdin.readLineSync();

  print("email: ");
  var email = stdin.readLineSync();

  var p = '[{"nome" : "$nome", "senha" : "$senh", "email" : "$email"}]';
  var json = jsonDecode(p);

  List<Cadastro> conta;

  conta = (json as List).map((item) => Cadastro.fromJson(item)).toList();

  penis.add(conta);
  // --i;
  var je = JsonEncoder.withIndent(' ');
  await arqu.writeAsString(je.convert(penis));
  var pi = await arqu.readAsString();
  var conteu = jsonDecode(pi);
  print(conteu);
}
