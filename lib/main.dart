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
      title: 'DANAE KATHERIN LARGO B',
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
  int _selectedIndex = 0;

  // Lista de pantallas que se mostrarán en cada índice.
  final List<Widget> _screens = [
    BaseConversionScreen(),
    CurrencyConverterScreen(),
    PrimeNumberScreen(),
    ThemeChangerScreen(),
  ];

  // Método para actualizar el índice seleccionado.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aplicación Multitarea')),
      body: _screens[_selectedIndex], // Pantalla actual basada en el índice seleccionado.
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Números',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Divisas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'Primo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_6),
            label: 'Tema',
          ),
        ],
        currentIndex: _selectedIndex, // Índice seleccionado actualmente.
        onTap: _onItemTapped, // Actualiza la pantalla al tocar un ícono.
        type: BottomNavigationBarType.fixed, // Permite mostrar todos los ítems en la barra.
        selectedItemColor: Theme.of(context).primaryColor, // Color del ítem seleccionado.
        unselectedItemColor: Colors.grey, // Color de los ítems no seleccionados.
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
