import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  // Valor que maneja el estado del tema (true = oscuro, false = claro)
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // Método para alternar el tema
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();  // Notifica a los oyentes para actualizar el estado
  }
}
