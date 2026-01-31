# Projetos-com-dart
### Descrição:
criação de 4 projetos suregirdos pelo chat gpt, onde envolvel a utilização de POO (basica), tratamento de erros, exportação e importação de dados em um arquivo json, fatury, funções assincronas, estrutura de dados.

### Feramentas usadas:
![Dart](https://img.shields.io/badge/-Dart-0D1117?style=for-the-badge&logo=dart&labelColor=0D1117&textColor=0D1117&logoColor=0175C2)&nbsp;
![Json](https://img.shields.io/badge/-Json-0D1117?style=for-the-badge&logo=typeorm&labelColor=0D1117&textColor=0D1117&logoColor=F5822A)&nbsp;
![Visual Studio Code](https://img.shields.io/badge/-Visual%20Studio%20Code-0D1117?style=for-the-badge)&nbsp;

## 1) calculadora
calculadora com função com returno dinamica, que possiu tratamento de erros, o projeto também possui historico de calculos anteriores. Primeiro projeto com a linguagem dart

```dart
import 'dart:io';

dynamic calculadora(
  int? x1,
  String? cond,
  dynamic result,
  Map<String, int> historico,
) {
  try {
    switch (cond) {
      case "+":
        return result + x1;
      case "-":
        return result - x1;
      case "*":
        return result * x1;
      case "/":
        return result / x1;
      case "%":
        return result % x1;
      default:
        print("não é operador");
        return result;
    }
  } on NoSuchMethoError {
    result = result == null ? 1 : result;
    switch (cond) {
      case "*":
        return result * x1;
      case "/":
        return result / x1;
      case "%":
        return result % x1;
      default:
        print("não é operador");
        return result;
    }
  } on Error {
    return x1;
  }
}

dynamic verifica(String primeiroVal) {
  int? r;
  try {
    r = int.parse(primeiroVal);
  } on FormatException catch (primeiroVal) {
    r = null;
    print("$primeiroVal não é numero");
  }
  return r;
}

String? condicao, p;
int? i = 0;
dynamic res, n;
Map<String, int> his = {};

void main() {
  print(
    "-------calculadora simples-------"
    '----ctrl C para parar'
    'his para consultar historico----',
  );
  print("his ou calcular/cal/c? ");
  condicao = stdin.readLineSync();
  print("numero: ");
  var pi = stdin.readLineSync();
  res = verifica(pi!);
  String? cont = "$res ";
  do {

    if (condicao == "his") {
      print(his);
      res = 0;
      condicao = " ";
    } else {
      do {
        print("opereador: ");
        condicao = stdin.readLineSync();
        if (condicao == "=") {
          cont = cont! + " $p";
          print("$cont = $res");
          his[cont] = res!;
        } else {
          print("numero: ");
          p = stdin.readLineSync();
          n = verifica(p!);
          res = calculadora(n, condicao, res, his);
          cont = cont! + " $n $condicao";
        }
      } while (condicao != "=");
    }
    print("his ou calcular/cal/c? ");
    condicao = stdin.readLineSync();
    cont = "";
  } while (true);
}

```

## 2) To-Do List
basicamente um projeto para criar, modificar, excluir e concluir tarefas. Projeto feito com POO (basico), override e tratamento de erros

```dart
import 'dart:io';


class Lista {
  List<String> myL = [];

  void acresentarL(String item) {
    this.myL.add(item);
    print("tarefa adicionada!");
  }

  void retirarL(int item) {
    try {
      this.myL.removeAt(item);
      print("tarefa remocida");
    } on RangeError {
      print("não temos a posição $item");
    }
  }

  void modicicarL(int i, String item) {
    try {
      this.myL[i] = item;
      print("tarefa modificada!!");
    } on RangeError {
      print("não temos a posição $i");
    }
  }

  void concluidoL(int i) {
    try {
      this.myL[i] += "concluida";
      print("tarefa concluida!!!!");
    } on RangeError {
      print("não temos a posição $i");
    }
  }

  @override
 String toString() {
    return "$myL";
  }
}

var p = Lista();

void main() {
  do {
    print(
      "Lista de comandos: \n adicinonar : adi \n excluir : exc \n modificar : mod \n concluida : con",
    );
    print("o que deseja fazer");
    String? acao = stdin.readLineSync();
    switch (acao) {
      case "adi":
        print("adiconar o que?");
        String? it = stdin.readLineSync();
        p.acresentarL(it!);
        break;
      case "exc":
        print("lista: $p");
        print("excluir item de qual posição?");
        int it = int.parse(stdin.readLineSync()!);
        p.retirarL(it);
        break;
      case "mod":
        print("lista: $p");
        print("modificar item de qual posição?");
        int? i = stdin.readByteSync();
        print("dejesa colocar o que na posição $i?");
        String? it = stdin.readLineSync();
        p.modicicarL(i, it!);
        break;
      case "con":
        print("a tarefa de qual posição foi concluida?");
        int? i = stdin.readByteSync();
        p.concluidoL(i);
        break;
      default:
        print("isso não existe ou esta escrito errado \nfaça denovo \n");
    }
  } while (true);
}
```

## 3) GRUD para um Json
GRUD conde exporta uma lista de dados para um arquivo .json, e após iniciar o projeto novamente, ele importa dados do mesmo arquivo .json. Projeto com o contrutor factory

```dart
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
List pe = [];
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

  pe.add(conta);
  // --i;
  var je = JsonEncoder.withIndent(' ');
  await arqu.writeAsString(je.convert(pe));
  var pi = await arqu.readAsString();
  var conteu = jsonDecode(pi);
  print(conteu);
}
```

## 4) Sistema bancario
Sistema bancario com ações de sacar, depositar, ver saldo e tranferencia, onde, na trasferencia o algorito compara em uma lista de contas (no caso somente com uma) se o titular e o numero bancario é igual a alguma das contas que a lá dentro

```dart
import 'dart:io';

class ContaBanco1 {
  String? titular = "Anbolio", numeroBancario = "1234";
  double saldo = 1000.0;

  dynamic sacar(double valor, String tit, String nuB) {
    if (valor < this.saldo) {
      if (tit == this.titular && nuB == this.numeroBancario) {
        this.saldo -= valor;
        return "$valor sacado";
      } else {
        return "titular ou numero bancario não está correto";
      }
    } else {
      return ("valor muito auto, saldo insuficiente");
    }
  }

  dynamic depositar(double valor, String tit, String nuB) {
    if (tit == this.titular && nuB == this.numeroBancario) {
      this.saldo += valor;
      return "$valor depositado";
    } else {
      return "titular ou numero bancario não está correto";
    }
  }

  dynamic verificar(String tit, String nuB) {
    if (tit == this.titular && nuB == this.numeroBancario) {
      return this.saldo;
    } else {
      return "titular ou numero bancario não está correto";
    }
  }

  dynamic transferencia(
    Map<String, dynamic> contaL,
    double valor,
    String tit,
    String nuB,
  ) {
    if (tit == contaL['titular'] && nuB == contaL['numeroBancario']) {
      if (valor < saldo) {
        this.saldo -= valor;
        return "você tranferiu $valor para $tit!!";
      } else {
        return ("valor muito auto, saldo insuficiente");
      }
    } else {
      return "titular ou numero bancario incorretos";
    }
  }
}

Map<String, dynamic> contas = {"titular": "marcos", "numeroBancario": "1233"};
var con = ContaBanco1();
void main() async {
  do {
    print(
      "o que quer fazer \n depositar : dep \n sacar : sac \n ver saldo : ver \n transação : tra",
    );
    var p = stdin.readLineSync();

    switch (p) {
      case "dep":
        print("qual o titular?");
        var tit = stdin.readLineSync();
        print("qual o numero Bancario?");
        var nuB = stdin.readLineSync();
        print("qual o valor que dejesa depostitar?");
        var valor = double.parse(stdin.readLineSync()!);
        print(con.depositar(valor, tit!, nuB!));
        break;
      case "sac":
        print("qual o titular?");
        var tit = stdin.readLineSync();
        print("qual o numero Bancario?");
        var nuB = stdin.readLineSync();
        print("qual o valor que dejesa sacar?");
        var valor = double.parse(stdin.readLineSync()!);
        print(con.sacar(valor, tit!, nuB!));
        break;
      case "ver":
        print("qual o titular?");
        var tit = stdin.readLineSync();
        print("qual o numero Bancario?");
        var nuB = stdin.readLineSync();
        print(con.verificar(tit!, nuB!));
        break;
      case "tra":
        print("qual o titular do destinaraio?");
        var tit = stdin.readLineSync();
        print("qual o numero Bancario do destinaraio?");
        var nuB = stdin.readLineSync();
        print("quanto dejesa transferir?");
        var valor = double.parse(stdin.readLineSync()!);
        print(con.transferencia(contas, valor, tit!, nuB!));
        break;
      default:
    }
  } while (true);
}

```

