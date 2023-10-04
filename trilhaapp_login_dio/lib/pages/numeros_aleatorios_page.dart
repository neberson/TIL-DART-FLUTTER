import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int? numeroGerado;
  int? quantidadeCliques;
  final chaveNumeroAleatorio = 'numero_aleatorio';
  final chaveQuantidadeCliques = 'numero_cliques';
  late SharedPreferences storage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(chaveNumeroAleatorio) ?? 0;
      quantidadeCliques = storage.getInt(chaveQuantidadeCliques) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Gerador de números aleatórios"),
          ),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  numeroGerado.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  quantidadeCliques.toString(),
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () async {
                var random = Random();
                setState(() {
                  numeroGerado = random.nextInt(1000);
                  quantidadeCliques = quantidadeCliques! + 1;
                });
                storage.setInt(chaveNumeroAleatorio, numeroGerado!);
                storage.setInt(chaveQuantidadeCliques, quantidadeCliques!);
              })),
    );
  }
}
