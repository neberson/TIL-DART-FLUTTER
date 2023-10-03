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
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  List<String> results = [];

  void calculaIMC() {
    double altura = double.parse(alturaController.text);
    double peso = double.parse(pesoController.text);
    double imc = peso / (altura * altura);
    String result = 'IMC: ${imc.toStringAsFixed(2)}';
    setState(() {
      debugPrint(result);
      results.add(result);
      alturaController.clear();
      pesoController.clear();
      debugPrint(results.length.toString());
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
              onPressed: calculaIMC,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Resultados:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(results[index]),
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
