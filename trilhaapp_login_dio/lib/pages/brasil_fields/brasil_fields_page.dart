import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  var controllerCEP = TextEditingController();
  var controllerCPF = TextEditingController();
  var controllerCentavos = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Brasil Fields'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  TextFormField(
                    controller: controllerCEP,
                    decoration: const InputDecoration(
                        hintText: 'CEP Formatado',
                        labelText: 'CEP Formatado',
                        border: OutlineInputBorder()),
                    inputFormatters: [
                      // obrigatório
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controllerCPF,
                    decoration: const InputDecoration(
                        hintText: 'CPF Formatado',
                        labelText: 'CPF Formatado',
                        border: OutlineInputBorder()),
                    inputFormatters: [
                      // obrigatório
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controllerCentavos,
                    decoration: const InputDecoration(
                        hintText: 'Centavos',
                        labelText: 'Centavos',
                        border: OutlineInputBorder()),
                    inputFormatters: [
                      // obrigatório
                      FilteringTextInputFormatter.digitsOnly,
                      CentavosInputFormatter(moeda: true),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Continuar")),
                  )
                ],
              ),
            )));
  }
}
