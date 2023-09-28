import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 135, 67, 186),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Camera"),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.album),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 135, 67, 186)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
              ),
              accountName: const Text("Neberson Andrade"),
              accountEmail: const Text("neberson_mtv@hotmail.com"),
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person, color: Colors.white),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Dados Cadastrais",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadastraisPage()));
            },
          ),
          const Divider(color: Colors.white),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person, color: Colors.white),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Termos de uso e privacidade",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
            onTap: () => {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  context: context,
                  builder: (BuildContext bc) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Column(
                        children: [
                          Text(
                            "Termos de uso e privacidade",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "O empenho em analisar o novo modelo estrutural aqui preconizado prepara-nos para enfrentar situações atípicas decorrentes do sistema de participação geral. Podemos já vislumbrar o modo pelo qual o entendimento das metas propostas afeta positivamente a correta previsão das novas proposições. A nível organizacional, a mobilidade dos capitais internacionais aponta para a melhoria do processo de comunicação como um todo. Não obstante, a necessidade de renovação processual é uma das consequências das condições financeiras e administrativas exigidas. As experiências acumuladas demonstram que o fenômeno da Internet agrega valor ao estabelecimento dos paradigmas corporativos.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  })
            },
          ),
          const Divider(color: Colors.white),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Configurações",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
            onTap: () => {},
          ),
          const Divider(color: Colors.white),
        ],
      ),
    );
  }
}
