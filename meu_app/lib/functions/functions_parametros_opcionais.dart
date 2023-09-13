void main(List<String> arguments) {
  printName("Neberson");
  printName("Neberson", sobrenome: "Andrade");

  printNameNull("Neberson");
  printNameNull("Neberson", sobrenome: "Andrade");
}

void printName(String name, {String sobrenome = ""}) {
  print("My name is: $name");
  print("My lastname is: $sobrenome");
}

void printNameNull(String name, {String? sobrenome}) {
  print("My name is: $name");
  if (sobrenome != null) {
    print("My lastname is: $sobrenome");
  }
}
