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
      this.myL[i] = "concluida";
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
      case "exc":
        print("lista: $p");
        print("excluir item de qual posição?");
        int? it = stdin.readByteSync();
        p.retirarL(it);
        break;
      case "mod":
        print("lista: $p");
        print("modificar item de qual posição?");
        int? i = stdin.readByteSync();
        print("dejesa colocar o que na posição $i?");
        String? it = stdin.readLineSync();
        p.modicicarL(i, it!);
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
