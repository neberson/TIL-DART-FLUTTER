import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagem_repository.dart';
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
  var linguagens = [];
  var linhagensSelecionadas = [];
  double pretensaoSalario = 1000;

  @override
  void initState() {
    niveis = NivelRepository.retornaNiveis();
    linguagens = LinguagensRepository.retornaLinguagens();
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
          child: ListView(
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
                        dense: true,
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
              const TextLabel(texto: "Linguagens preferidas"),
              Column(
                children: linguagens
                    .map((linguagem) => CheckboxListTile(
                        dense: true,
                        title: Text(linguagem),
                        value: linhagensSelecionadas.contains(linguagem),
                        onChanged: (bool? value) {
                          if (value!) {
                            setState(() {
                              linhagensSelecionadas.add(linguagem);
                            });
                          } else {
                            setState(() {
                              linhagensSelecionadas.remove(linguagem);
                            });
                          }
                        }))
                    .toList(),
              ),
              Expanded(
                  child: TextLabel(
                      texto:
                          "Pretensão salarial. R\$ ${pretensaoSalario.round().toString()}")),
              Slider(
                  value: pretensaoSalario,
                  min: 1000,
                  max: 10000,
                  divisions: 9,
                  label: pretensaoSalario.toStringAsFixed(0),
                  onChanged: (value) {
                    setState(() {
                      pretensaoSalario = value;
                    });
                  }),
              TextButton(onPressed: () {}, child: const Text("Salvar"))
            ],
          ),
        ));
  }
}
