import 'package:flutter/material.dart';

class BaseConversionScreen extends StatefulWidget {
  @override
  _BaseConversionScreenState createState() => _BaseConversionScreenState();
}

class _BaseConversionScreenState extends State<BaseConversionScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void convertNumber() {
    String input = _controller.text;
    if (input.isEmpty) {
      setState(() {
        _result = 'Por favor ingresa un número.';
      });
      return;
    }
    
    int decimalValue = int.tryParse(input) ?? -1;

    if (decimalValue == -1) {
      setState(() {
        _result = 'Entrada no válida.';
      });
      return;
    }

    setState(() {
      _result = '''
      Binario: ${decimalValue.toRadixString(2)}
      Octal: ${decimalValue.toRadixString(8)}
      Hexadecimal: ${decimalValue.toRadixString(16)}
      Decimal: $decimalValue
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conversión de Bases")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingresa un número en decimal",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertNumber,
              child: Text("Convertir"),
            ),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
