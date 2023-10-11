import 'package:flutter/material.dart';
import 'package:trilhaapp/model/via_cep_model.dart';
import 'package:trilhaapp/repositories/via_cep_repository.dart';

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  TextEditingController cepController = TextEditingController(text: '');

  bool loading = false;
  ViaCepModel viaCepModel = ViaCepModel();
  var viaCEPRepository = ViaCepRespository();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text(
              'Consulta de CEP',
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              controller: cepController,
              maxLength: 8,
              keyboardType: TextInputType.number,
              onChanged: (value) async {
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  viaCepModel = await viaCEPRepository.consultarCEP(cep);
                }
                setState(() {
                  loading = false;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              viaCepModel.logradouro ?? '',
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              '${viaCepModel.localidade ?? ''} - ${viaCepModel.uf ?? ''}',
              style: const TextStyle(fontSize: 22),
            ),
            Visibility(
                visible: loading, child: const CircularProgressIndicator())
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
    ));
  }
}
