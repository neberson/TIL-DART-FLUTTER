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
          UserAccountsDrawerHeader(
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
            onTap: () => {},
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
          const Divider(),
        ],
      ),
    );
  }
}
