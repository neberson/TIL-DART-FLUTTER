import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/pagina_3.dart';
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
                children: const [CardPage(), ImageAssetsPage(), Pagina3Page()],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  setState(() {
                    pageController.jumpToPage(value);
                  });
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Pag1"),
                  BottomNavigationBarItem(icon: Icon(Icons.add), label: "Pag2"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Pag3"),
                ])
          ],
        ),
      ),
    );
  }
}
