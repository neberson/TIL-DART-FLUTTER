import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewHorizontalPage extends StatefulWidget {
  const ListViewHorizontalPage({super.key});

  @override
  State<ListViewHorizontalPage> createState() => _ListViewHorizontalPageState();
}

class _ListViewHorizontalPageState extends State<ListViewHorizontalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Expanded(
          flex: 2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
                        Card(elevation: 8, child: Image.asset(AppImages.paisagem1, height: 100,)),
                        Card(elevation: 8, child: Image.asset(AppImages.paisagem2, height: 100,)),
                        Card(elevation: 8, child: Image.asset(AppImages.paisagem3, height: 100,))
                      ],
          ),
        ),
        Expanded(flex: 3, child: Container(),)
      ],
    ),);
  }
}
