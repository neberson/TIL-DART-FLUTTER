import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuário 2"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá! Tudo bem?"),
              Text("08:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {},
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: "manu1", child: Text("Opção 1")),
                const PopupMenuItem<String>(
                    value: "manu2", child: Text("Opção 2")),
                const PopupMenuItem<String>(
                    value: "manu3", child: Text("Opção 3"))
              ];
            },
          ),
          isThreeLine: true,
        ),
        Image.asset(
          AppImages.user1,
        ),
        Image.asset(
          AppImages.user2,
        ),
        Image.asset(
          AppImages.user3,
        ),
        Image.asset(
          AppImages.paisagem1,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.paisagem2,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.paisagem3,
          width: double.infinity,
        )
      ],
    );
  }
}
