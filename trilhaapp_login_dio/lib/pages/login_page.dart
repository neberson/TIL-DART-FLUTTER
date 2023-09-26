import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: "email@email.com");
  var senhaController = TextEditingController(text: "123");
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 3,
                          child: Image.network(
                              "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Já tem cadastro?",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Faça seu login e make the change",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        height: 30,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(top: 0),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 135, 67, 186))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 135, 67, 186))),
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 135, 67, 186),
                              )),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        height: 30,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          obscureText: isObscureText,
                          controller: senhaController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(top: 0),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 135, 67, 186))),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 135, 67, 186))),
                              hintText: "Senha",
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 135, 67, 186),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(
                                  isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color:
                                      const Color.fromARGB(255, 135, 67, 186),
                                ),
                              )),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: TextButton(
                            onPressed: () {
                              if (emailController.text.trim() ==
                                      "email@email.com" &&
                                  senhaController.text.trim() == "123") {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainPage()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Erro ao efetuar login")));
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 135, 67, 186))),
                            child: const Text(
                              "Entrar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                    ),
                    Expanded(child: Container()),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      child: const Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                            color: Colors.yellow, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      child: const Text(
                        "Criar Conta",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
