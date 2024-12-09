import 'package:app_2/welcome_screen.dart';
import 'package:flutter/material.dart';
// Importa la pantalla de bienvenida

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Películas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(), // Pantalla de bienvenida
    );
  }
}