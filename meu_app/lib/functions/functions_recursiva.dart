void main(List<String> arguments) {
  var fatorial_calculado = fatorial(3);
  print(fatorial_calculado);
}

int fatorial(int numero) {
  if (numero == 1) {
    return 1;
  }
  return numero * fatorial(numero - 1);
}
