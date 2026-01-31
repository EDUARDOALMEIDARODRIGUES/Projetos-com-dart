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
  } on NoSuchMethodError {
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
