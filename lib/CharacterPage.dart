import 'package:flutter/material.dart';

class CharacterPage extends StatelessWidget {
  final String nombre;
  final int edad;
  final String quirk;
  final String imagen;

  const CharacterPage({
    super.key,
    required this.nombre,
    required this.edad,
    required this.quirk,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagen), // Imagen de fondo.
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black.withOpacity(0.7), // Fondo semitransparente.
              child: Column(
                children: [
                  Text(
                    'Nombre: $nombre',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Edad: $edad',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Quirk: $quirk',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
