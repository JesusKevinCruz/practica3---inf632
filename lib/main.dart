import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practica 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PalindromeScreen()),
                );
              },
              child: const Text('Verificar si un Texto es un Palíndromo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AmigosScreen()),
                );
              },
              child: const Text('Identificar si son Números Amigos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BinarioScreen()),
                );
              },
              child: const Text('Convertidor de Número a Binario'),
            ),
          ],
        ),
      ),
    );
  }
}

class PalindromeScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  PalindromeScreen({super.key});

  bool esPalindromo(String texto) {
    String limpio = texto.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    return limpio == limpio.split('').reversed.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verificar Palíndromo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Ingrese un texto'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String texto = controller.text;
                bool resultado = esPalindromo(texto);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(
                      resultado
                          ? 'El texto es un palíndromo.'
                          : 'El texto no es un palíndromo.',
                    ),
                  ),
                );
              },
              child: const Text('Verificar'),
            ),
          ],
        ),
      ),
    );
  }
}

class AmigosScreen extends StatelessWidget {
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  AmigosScreen({super.key});

  bool sonNumerosAmigos(int a, int b) {
    int sumaDivisores(int n) {
      int suma = 0;
      for (int i = 1; i <= n ~/ 2; i++) {
        if (n % i == 0) suma += i;
      }
      return suma;
    }

    return sumaDivisores(a) == b && sumaDivisores(b) == a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Números Amigos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numero1Controller,
              decoration:
                  const InputDecoration(labelText: 'Ingrese el primer número'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: numero2Controller,
              decoration:
                  const InputDecoration(labelText: 'Ingrese el segundo número'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int num1 = int.parse(numero1Controller.text);
                int num2 = int.parse(numero2Controller.text);
                bool resultado = sonNumerosAmigos(num1, num2);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(
                      resultado
                          ? 'Los números son amigos.'
                          : 'Los números no son amigos.',
                    ),
                  ),
                );
              },
              child: const Text('Verificar'),
            ),
          ],
        ),
      ),
    );
  }
}

class BinarioScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  BinarioScreen({super.key});

  String convertirABinario(int numero) {
    return numero.toRadixString(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Convertidor a Binario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration:
                  const InputDecoration(labelText: 'Ingrese un número entero'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int numero = int.parse(controller.text);
                String binario = convertirABinario(numero);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text('El número en binario es: $binario'),
                  ),
                );
              },
              child: const Text('Convertir'),
            ),
          ],
        ),
      ),
    );
  }
}
