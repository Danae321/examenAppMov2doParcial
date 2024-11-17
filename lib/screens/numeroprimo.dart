import 'package:flutter/material.dart';

class PrimeNumberScreen extends StatefulWidget {
  @override
  _PrimeNumberScreenState createState() => _PrimeNumberScreenState();
}

class _PrimeNumberScreenState extends State<PrimeNumberScreen> {
  final TextEditingController _primeController = TextEditingController();
  String _primeResult = "";

  void _checkPrime() {
    setState(() {
      int number = int.tryParse(_primeController.text) ?? 0;
      _primeResult = _isPrime(number) ? 'Es un número primo' : 'No es un número primo';
    });
  }

  bool _isPrime(int num) {
    if (num <= 1) return false;
    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verificar Número Primo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _primeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingresa un número'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _checkPrime,
              child: Text('Verificar'),
            ),
            SizedBox(height: 20),
            Text(
              _primeResult,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
