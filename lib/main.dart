import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/theme_model.dart';  
import 'screens/convertirnumero.dart';  
import 'screens/convertirdolaresabolivianosyviceversa.dart';
import 'screens/numeroprimo.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(), 
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context); 
    return MaterialApp(
      title: 'Aplicación Multitarea',
      theme: themeModel.isDarkMode
          ? ThemeData.dark()  
          : ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isIconsVisible = false;

  void _toggleIcons() {
    setState(() {
      _isIconsVisible = !_isIconsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla Principal')),
      body: Center(
        child: _isIconsVisible
            ? GridView.count(
                crossAxisCount: 2,
                children: [
                  IconButton(
                    icon: Icon(Icons.calculate),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BaseConversionScreen()), 
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.money),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CurrencyConverterScreen()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.calculate_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrimeNumberScreen()),  
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.brightness_6),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThemeChangerScreen()),
                      );
                    },
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: _toggleIcons,
                child: Text('Mostrar Opciones'),
              ),
      ),
    );
  }
}

class ThemeChangerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cambiar Tema')),
      body: Center(
        child: SwitchListTile(
          title: Text(themeModel.isDarkMode ? 'Modo Oscuro' : 'Modo Claro'),
          value: themeModel.isDarkMode,
          onChanged: (bool value) {
            themeModel.toggleTheme();
          },
        ),
      ),
    );
  }
}
