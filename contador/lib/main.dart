import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int countPessoas = 0;

  void decrement() {
    setState(() {
      countPessoas--;
    });
  }

  void increment() {
    setState(() {
      countPessoas++;
    });
  }

  bool get isEmpty => countPessoas == 0;

  bool get isFull => countPessoas == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/image.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar!',
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                '$countPessoas',
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: isEmpty ? null : decrement,
                  child: const Text(
                    'Saiu',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: isFull ? null : increment,
                  child: const Text(
                    'Entrou',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
