import 'package:flutter/material.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/repositories/dados_cadastrais_repository.dart';
import 'package:trilhaapp/repositories/linguagem_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastraisHivePage extends StatefulWidget {
  const DadosCadastraisHivePage({super.key});

  @override
  State<DadosCadastraisHivePage> createState() =>
      _DadosCadastraisHivePageState();
}

class _DadosCadastraisHivePageState extends State<DadosCadastraisHivePage> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  DadosCadastraisModel dadosCadastraisModel = DadosCadastraisModel.vazio();
  var nomeController = TextEditingController();
  var dataNascimentoController = TextEditingController();
  var niveis = [];
  var linguagens = [];

  bool salvando = false;

  @override
  void initState() {
    niveis = NivelRepository.retornaNiveis();
    linguagens = LinguagensRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento == null
        ? ""
        : dadosCadastraisModel.dataNascimento.toString();
    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItens(int quantidade) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidade; i++) {
      itens.add(DropdownMenuItem(value: i, child: Text(i.toString())));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
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
                          dadosCadastraisModel.dataNascimento = data;
                        }
                      },
                    ),
                    const TextLabel(texto: "Nivel de experiência"),
                    Column(
                      children: niveis
                          .map((nivel) => RadioListTile(
                              dense: true,
                              selected: dadosCadastraisModel.nivelExperiencia ==
                                  nivel,
                              title: Text(nivel.toString()),
                              value: nivel.toString(),
                              groupValue: dadosCadastraisModel.nivelExperiencia,
                              onChanged: (value) {
                                setState(() {
                                  dadosCadastraisModel.nivelExperiencia =
                                      value.toString();
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
                              value: dadosCadastraisModel.linguagens
                                  .contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    dadosCadastraisModel.linguagens
                                        .add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    dadosCadastraisModel.linguagens
                                        .remove(linguagem);
                                  });
                                }
                              }))
                          .toList(),
                    ),
                    const TextLabel(texto: "Tempo de experiência"),
                    DropdownButton(
                        isExpanded: true,
                        value: dadosCadastraisModel.tempoExperiencia,
                        items: returnItens(50),
                        onChanged: (value) {
                          setState(() {
                            dadosCadastraisModel.tempoExperiencia =
                                int.parse(value.toString());
                          });
                        }),
                    TextLabel(
                        texto:
                            "Pretensão salarial. R\$ ${dadosCadastraisModel.salario?.round().toString()}"),
                    Slider(
                        value: dadosCadastraisModel.salario ?? 0,
                        min: 1000,
                        max: 10000,
                        divisions: 9,
                        label: dadosCadastraisModel.salario?.toStringAsFixed(0),
                        onChanged: (value) {
                          setState(() {
                            dadosCadastraisModel.salario = value;
                          });
                        }),
                    TextButton(
                      child: const Text("Salvar"),
                      onPressed: () async {
                        setState(() {
                          salvando = false;
                        });
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                  "O nome digitado é inválido ou está vázio!")));
                          return;
                        }
                        if (dadosCadastraisModel.dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content:
                                      Text("Data de nascimento inválida!")));
                          return;
                        }
                        if (dadosCadastraisModel.nivelExperiencia == null ||
                            dadosCadastraisModel.nivelExperiencia?.trim() ==
                                '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content:
                                      Text("O nível deve ser selecionado!")));
                          return;
                        }
                        if (dadosCadastraisModel.linguagens.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text(
                                      "Selecione pelo menos uma linguagem!")));
                          return;
                        }
                        if (dadosCadastraisModel.tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                  "Deve ter ao menos 1 ano de experiência em uma das linguagens!")));
                          return;
                        }
                        dadosCadastraisModel.nome = nomeController.text;
                        dadosCadastraisRepository.salvar(dadosCadastraisModel);
                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            salvando = false;
                          });
                        });
                      },
                    )
                  ],
                ),
        ));
  }
}
