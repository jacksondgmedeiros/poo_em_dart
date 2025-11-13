

// import 'package:poo_em_dart/conta.dart';

import 'package:poo_em_dart/conta.dart';

void main() {
  ContaCorrente contaJackson = ContaCorrente("Jackson", 1000);
  
  ContaPoupanca contaJoaquim = ContaPoupanca("Joaquim", 500);
  
  // List<Conta> contas = <Conta>[contaJackson, contaJoaquim]; 

  // for (var conta in contas) {
  //   conta.imprimeSaldo();
  // }


  contaJackson.receber(1000);
  contaJoaquim.enviar(200);
}