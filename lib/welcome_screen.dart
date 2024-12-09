import 'package:flutter/material.dart';
import 'login_screen.dart'; // Importa la pantalla de login
import 'register_screen.dart'; // Importa la pantalla de registro

// ignore: use_key_in_widget_constructors
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo degradado
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.teal, Colors.cyanAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título con estilo
              Text(
                '¡BIENVENIDO A PELICULAS DE ESTRENO!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3,
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Imagen decorativa
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/movie_logo.png'),
                ),
              ),
              const SizedBox(height: 40),

              // Botón de inicio de sesión con estilo alternativo
              _buildStyledButton(context, 'Iniciar sesión', LoginScreen()),

              const SizedBox(height: 20),

              // Botón de registro con estilo alternativo
              _buildStyledButton(context, 'Registrarse', RegisterScreen()),
            ],
          ),
        ),
      ),
    );
  }

  // Función para crear un botón estilizado
  Widget _buildStyledButton(BuildContext context, String text, Widget nextScreen) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white, // Color del texto
        side: const BorderSide(color: Colors.white, width: 2), // Borde blanco
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Bordes redondeados
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
