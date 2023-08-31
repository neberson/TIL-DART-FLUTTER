void main(List<String> arguments) {
  // Variável dynamic pode armazenar diferentes tipos de valores
  dynamic meuValor = 42;
  print("meuValor é: $meuValor"); // Saída: meuValor é: 42

  meuValor = "Olá, mundo!";
  print("Agora meuValor é: $meuValor"); // Saída: Agora meuValor é: Olá, mundo!

  meuValor = [1, 2, 3];
  print("Agora meuValor é: $meuValor"); // Saída: Agora meuValor é: [1, 2, 3]

  // Você também pode chamar métodos em uma variável dynamic
  meuValor = "Olá";
  print(meuValor.toUpperCase()); // Saída: OLÁ
}
