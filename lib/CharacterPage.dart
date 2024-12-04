import 'package:flutter/material.dart';

class CharacterPage extends StatelessWidget {
  final String direccion;
  final int precio;
  final String descripcion;
  final String imagen;

  const CharacterPage({
    super.key,
    required this.direccion,
    required this.precio,
    required this.descripcion,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(direccion),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagen),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black.withOpacity(0.7),
              child: Column(
                children: [
                  Text(
                    'Dirección: $direccion',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Precio: $precio',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Descripción: $descripcion',
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
