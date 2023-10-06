import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() =>
      _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosHivePage> {
  int? numeroGerado;
  int? quantidadeCliques;
  late Box boxNumerosAleatorios;
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    if (Hive.isBoxOpen('box_numeros_aleatorios')) {
      boxNumerosAleatorios = Hive.box('box_numeros_aleatorios');
    } else {
      boxNumerosAleatorios = await Hive.openBox('box_numeros_aleatorios');
    }
    setState(() {
      numeroGerado = boxNumerosAleatorios.get('numeroGerado') ?? 0;
      quantidadeCliques = boxNumerosAleatorios.get('quantidadeCliques') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Gerador de números com Hive"),
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
                boxNumerosAleatorios.put('numeroGerado', numeroGerado!);
                boxNumerosAleatorios.put(
                    'quantidadeCliques', quantidadeCliques!);
              })),
    );
  }
}
