abstract class Conta {
  String? titular;

  // o simbolo _ é para definir um atributo como private
  double _saldo;

  // caso queira passar o valor em saldo, basta atribuir como está, [] indica que não é obrigatório
  // {} você pode definir onde quiser no construtor, desde que coloque saldo: 0
  Conta(this.titular, this._saldo);
  // outra maneira de construtor, chamado de construtor nomeado, onde não passa o valor do saldo
  //Conta.semSaldo(this.titular);
  //Conta.semDado();

  void receber(double valor) {
    _saldo += valor;
    print("$valor depositado!");
    imprimeSaldo();
  }

  void enviar(double valor) {
    if (valor <= _saldo) {
      _saldo -= valor;
      print("$valor sacado!");
      imprimeSaldo();
    }
  }

  void imprimeSaldo() {
    print("O saldo da conta de $titular é de R\$$_saldo");
  }
}

class ContaCorrente extends Conta {
  double emprestimo = 300;

  ContaCorrente(super.titular, super._saldo);

  @override
  void enviar(double valor) {
    if (_saldo + emprestimo >= valor) {
      _saldo -= valor;
      imprimeSaldo();
    }
  }
}

class ContaPoupanca extends Conta {
  double rendimento = 0.05;

  ContaPoupanca(super.titular, super._saldo);
  
  void calculaRendimento() {
    _saldo += _saldo * rendimento;
  }
}

mixin Imposto {
  double taxa = 0.03;

  double valorTaxado(double valor) {
    return valor * taxa;
  }
}

class ContaEmpresa extends Conta with Imposto {
  ContaEmpresa(super.titular, super._saldo);

  @override
  void enviar(double valor) {
    if (_saldo >= valor + valorTaxado(valor)) {
      _saldo -= valor + valorTaxado(valor);
      imprimeSaldo();
    }
  }

  @override
  void receber(double valor) {
    _saldo += valor - valorTaxado(valor);
    imprimeSaldo();
  }
}

class ContaInvestimento extends Conta with Imposto {
  ContaInvestimento(super.titular, super._saldo);

  @override
  void enviar(double valor) {
    if (_saldo >= valor + valorTaxado(valor)) {
      _saldo -= valor + valorTaxado(valor);
      imprimeSaldo();
    }
  }

  @override
  void receber(double valor) {
    _saldo += valor - valorTaxado(valor);
    imprimeSaldo();
  }
}
