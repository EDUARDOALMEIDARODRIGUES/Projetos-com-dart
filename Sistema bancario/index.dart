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
