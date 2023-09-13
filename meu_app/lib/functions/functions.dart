void main(List<String> arguments) {
  printHelloWorld();
  printName("Neberson");
  var number = returnNumber();
  print(number);

  var resultado = sum(10, 50);

  print(resultado);
}

void printHelloWorld() {
  print("Hello World");
}

void printName(String name) {
  print("My name is: $name");
}

int returnNumber() {
  return 30;
}

int sum(int number1, int number2) {
  return number1 + number2;
}
