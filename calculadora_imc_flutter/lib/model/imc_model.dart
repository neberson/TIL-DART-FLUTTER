class IMC {
  late int id;
  late double altura;
  late double peso;
  double? imc;

  IMC.vazio() {
    altura = 0.0;
    peso = 0.0;
    imc = 0.0;
  }

  IMC({required this.id, required this.altura, required this.peso, this.imc});

  void calculaIMC() {
    imc = peso / (altura * altura);
  }
}
