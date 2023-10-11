import 'package:flutter/material.dart';
import 'package:trilhaapp/model/characters_model.dart';
import 'package:trilhaapp/repositories/marvel/characters_repository.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});
  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final ScrollController _scrollController = ScrollController();
  late MarvelRepository marvelRepository;
  CharactersModel charactersModel = CharactersModel();
  int offset = 0;
  var carregando = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      var posicaoParaPaginar =
          (_scrollController.position.maxScrollExtent * 0.9);
      if (_scrollController.position.pixels > posicaoParaPaginar) {
        _carregarDados();
      }
    });
    marvelRepository = MarvelRepository();
    super.initState();
    _carregarDados();
  }

  _carregarDados() async {
    if (carregando) return;
    setState(() {
      carregando = true;
    });

    if (charactersModel.data == null || charactersModel.data!.results == null) {
      charactersModel = await marvelRepository.getCharacters(offset);
    } else {
      offset += charactersModel.data!.count!;
      var tempList = await marvelRepository.getCharacters(offset);
      charactersModel.data!.results!.addAll(tempList.data!.results!);
    }

    setState(() {
      carregando = false;
    });
  }

  int retornaQuantidadeTotal() {
    try {
      return charactersModel.data!.total!;
    } catch (e) {
      return 0;
    }
  }

  int retornaQuantidadeAtual() {
    try {
      return offset + charactersModel.data!.count!;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              'Heroes Marvel: ${retornaQuantidadeAtual()}/${retornaQuantidadeTotal()}'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: charactersModel.data == null ||
                            charactersModel.data!.results == null
                        ? 0
                        : charactersModel.data!.results!.length,
                    itemBuilder: (_, index) {
                      var character = charactersModel.data!.results![index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                maxRadius: 50,
                                backgroundImage: NetworkImage(
                                    '${character.thumbnail!.path!}.${character.thumbnail!.extension!}'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        character.name!,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(character.description!),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
            !carregando
                ? ElevatedButton(
                    onPressed: () {
                      _carregarDados();
                    },
                    child: const Text('Carregar mais itens'))
                : const Padding(
                    padding: EdgeInsets.all(8),
                    child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
