import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late SharedPreferences storage;
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  final chaveNomeUsuario = 'chaveNomeUsuario';
  final chaveAltura = 'chaveAltura';
  final chaveReceberNotificacao = 'chaveReceberNotificacao';
  final chaveTemaEscuro = 'chaveTemaEscuro';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();

    setState(() {
      nomeUsuarioController.text = storage.getString(chaveNomeUsuario) ?? '';
      alturaController.text = (storage.getDouble(chaveAltura) ?? 0).toString();
      receberNotificacoes = storage.getBool(chaveReceberNotificacao) ?? false;
      temaEscuro = storage.getBool(chaveTemaEscuro) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: const InputDecoration(hintText: 'Nome Usuário'),
              controller: nomeUsuarioController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Altura'),
              controller: alturaController,
            ),
          ),
          SwitchListTile(
              title: const Text('Receber notificações via push'),
              value: receberNotificacoes,
              onChanged: (value) {
                setState(() {
                  receberNotificacoes = value;
                });
              }),
          SwitchListTile(
              title: const Text('Tema escuro'),
              value: temaEscuro,
              onChanged: (value) {
                setState(() {
                  temaEscuro = value;
                });
              }),
          TextButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                try {
                  await storage.setDouble(
                      chaveAltura, double.parse(alturaController.text));
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text('Meu App'),
                          content:
                              const Text('Favor informar uma altura válida!'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Ok'))
                          ],
                        );
                      });
                  return;
                }
                await storage.setString(
                    chaveNomeUsuario, nomeUsuarioController.text);
                await storage.setBool(
                    chaveReceberNotificacao, receberNotificacoes);
                await storage.setBool(chaveTemaEscuro, temaEscuro);

                Navigator.pop(context);
              },
              child: const Text('Salvar'))
        ],
      ),
    ));
  }
}
