import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController();
  var dataNascimentoController = TextEditingController();
  DateTime? dataNascimento;
  var niveis = [];
  var nivelSelecionado = "";

  @override
  void initState() {
    niveis = NivelRepository.retornaNiveis();
    super.initState();
  }

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
              const TextLabel(texto: "Nome"),
              TextField(
                controller: nomeController,
              ),
              const TextLabel(texto: "Data de Nascimento"),
              TextField(
                controller: dataNascimentoController,
                readOnly: true,
                onTap: () async {
                  var data = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime(2099, 1, 1));
                  if (data != null) {
                    dataNascimentoController.text = data.toString();
                    dataNascimento = data;
                  }
                },
              ),
              const TextLabel(texto: "Nivel de experiência"),
              Column(
                children: niveis
                    .map((nivel) => RadioListTile(
                        selected: nivelSelecionado == nivel,
                        title: Text(nivel.toString()),
                        value: nivel.toString(),
                        groupValue: nivelSelecionado,
                        onChanged: (value) {
                          setState(() {
                            nivelSelecionado = value.toString();
                          });
                        }))
                    .toList(),
              ),
              TextButton(onPressed: () {}, child: const Text("Salvar"))
            ],
          ),
        ));
  }
}
