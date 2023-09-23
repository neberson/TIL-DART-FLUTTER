import 'package:flutter/material.dart';
import 'package:trilhaapp/service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeradoGerado = 0;
  var quantidadeCliques = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu App"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 200,
                width: 200,
                color: Colors.cyan,
                child: const Text("Ações do usuário")),
            Expanded(
              child: Container(
                  width: double.infinity,
                  color: Colors.orange,
                  child: Text("O número gerado foi $numeradoGerado")),
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: Container(
                  color: Colors.blueGrey,
                  child: Text("Foi clicado $quantidadeCliques vezes!")),
            ),
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                            color: Colors.amber, child: const Text("Nome"))),
                    Expanded(
                        flex: 7,
                        child: Container(
                            color: Colors.red,
                            child: const Text("Neberson Andrade"))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            color: Colors.green, child: const Text("10"))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            quantidadeCliques += 1;
            numeradoGerado =
                GeradorNumeroAleatorioService.gerarNumeroAleatorio(10);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
