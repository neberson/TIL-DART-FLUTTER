import 'package:calculadora_imc_flutter/model/imc_model.dart';
import 'package:calculadora_imc_flutter/repositories/imc_repository.dart';
import 'package:flutter/material.dart';

class CalculadoraIMCApp extends StatelessWidget {
  const CalculadoraIMCApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de IMC',
      home: CalculadoraIMC(),
    );
  }
}

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  IMCRepository imcRepository = IMCRepository();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  List<IMC> imcRegistrados = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarImcRegistrados();
  }

  Future<void> _carregarImcRegistrados() async {
    imcRegistrados = await imcRepository.obterIMCRegistrados();
    setState(() {});
  }

  Future<void> salvarIMC() async {
    var imcAtual = IMC(
        id: 0,
        altura: double.parse(alturaController.text),
        peso: double.parse(pesoController.text));
    imcAtual.calculaIMC();
    await imcRepository.salvar(imcAtual);
  }

  void limparCampos() {
    setState(() {
      alturaController.clear();
      pesoController.clear();
      alturaController.selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
            ),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await salvarIMC();
                limparCampos();
                await _carregarImcRegistrados();
              },
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Resultados:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: imcRegistrados.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Altura: ${imcRegistrados[index].altura.toStringAsFixed(2)}'),
                        Text(
                            'Peso: ${imcRegistrados[index].peso.toStringAsFixed(2)}'),
                        Text(
                            'IMC: ${imcRegistrados[index].imc!.toStringAsFixed(2)}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
