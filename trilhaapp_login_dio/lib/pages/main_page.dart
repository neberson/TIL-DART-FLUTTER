import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/list_view.dart';
import 'package:trilhaapp/pages/list_view_horizontal_page.dart';
import 'package:trilhaapp/pages/tarefas/tarefa_sqlite_page.dart';
import 'package:trilhaapp/pages/consulta_cep_page.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var pageController = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  ConsultaCepPage(),
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewPage(),
                  ListViewHorizontalPage(),
                  TarefaSQLitePage()
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  setState(() {
                    pageController.jumpToPage(value);
                  });
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.get_app_rounded), label: "HTTP"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Pag1"),
                  BottomNavigationBarItem(icon: Icon(Icons.add), label: "Pag2"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Pag3"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: "Pag4"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.house), label: "Tarefas"),
                ])
          ],
        ),
      ),
    );
  }
}
