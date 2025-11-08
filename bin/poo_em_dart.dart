

import 'package:poo_em_dart/conta.dart';

void main() {
  Conta contaJackson = Conta("Jackson", 1000);
  
  Conta contaJoaquim = Conta("Joaquim", 500);
  
  List<Conta> contas = <Conta>[contaJackson, contaJoaquim]; 

  for (var conta in contas) {
    conta.imprimeSaldo();
  }


  contaJackson.receber(1000);
  contaJoaquim.enviar(200);
}