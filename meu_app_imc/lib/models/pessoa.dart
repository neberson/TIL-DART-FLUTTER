class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura) {
    if (nome.isEmpty) {
      throw Exception("Nome inválido. O nome não pode estar vazio.");
    }
    if (peso <= 0) {
      throw Exception("Peso inválido. O peso deve ser maior que zero.");
    }
    if (altura <= 0) {
      throw Exception("Altura inválida. A altura deve ser maior que zero.");
    }
  }

  double calcularIMC() {
    return peso / (altura * altura);
  }

  String calcularStatusIMC() {
    double imc = calcularIMC();
    if (imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc < 24.9) {
      return "Peso normal";
    } else if (imc < 29.9) {
      return "Sobrepeso";
    } else if (imc < 34.9) {
      return "Obesidade grau 1";
    } else if (imc < 39.9) {
      return "Obesidade grau 2";
    } else {
      return "Obesidade grau 3";
    }
  }
}
