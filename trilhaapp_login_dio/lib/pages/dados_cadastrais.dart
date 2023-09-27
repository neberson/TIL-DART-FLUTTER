import 'package:flutter/material.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nome",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              TextField(
                controller: nomeController,
              ),
              TextButton(
                  onPressed: () {
                    print(nomeController.text);
                  },
                  child: const Text("Salvar"))
            ],
          ),
        ));
  }
}
