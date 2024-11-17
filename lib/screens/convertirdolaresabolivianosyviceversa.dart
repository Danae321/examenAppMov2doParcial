import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _convertedCurrency = "";

  final double _rateBolivianosToDollars = 0.14; // 1 Bs = 0.14 USD
  final double _rateDollarsToBolivianos = 6.96; // 1 USD = 6.96 Bs

  void _convertFromBolivianosToDollars() {
    setState(() {
      double inputAmount = double.tryParse(_inputController.text) ?? 0;
      double dollars = inputAmount * _rateBolivianosToDollars;
      _convertedCurrency = '\$USD: ${dollars.toStringAsFixed(2)}';
    });
  }

  void _convertFromDollarsToBolivianos() {
    setState(() {
      double inputAmount = double.tryParse(_inputController.text) ?? 0;
      double bolivianos = inputAmount * _rateDollarsToBolivianos;
      _convertedCurrency = 'Bs: ${bolivianos.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conversor de Moneda")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresa cantidad',
              ),
            ),
            SizedBox(height: 10),
            // Boton para convertir de bolivianos a dólares
            ElevatedButton(
              onPressed: _convertFromBolivianosToDollars,
              child: Text('Convertir de Bolivianos a Dólares'),
            ),
            SizedBox(height: 10),
            // Boton para convertir de dólares a bolivianos
            ElevatedButton(
              onPressed: _convertFromDollarsToBolivianos,
              child: Text('Convertir de Dólares a Bolivianos'),
            ),
            SizedBox(height: 20),
            // Mostrar el resultado de la conversión
            Text(
              _convertedCurrency,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
