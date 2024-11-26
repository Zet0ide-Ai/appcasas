import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyectoanime/services/firebase_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enciclopedia BNHA'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: getPersonajes(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final personaje = snapshot.data?[index];
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonajeDetail(
                          nombre: personaje['Nombre'],
                          edad: personaje['Edad'],
                          quirk: personaje['Quirk'],
                          imagen: personaje['Imagen'],
                        ),
                      ),
                    );
                  },
                  child: Text(personaje['Nombre']),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}

class PersonajeDetail extends StatelessWidget {
  final String nombre;
  final int edad;
  final String quirk;
  final String imagen;

  const PersonajeDetail({
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
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imagen), 
            fit: BoxFit.cover, 
          ),
        ),
        child: Center( 
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  Text(
                    'Nombre: $nombre',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center, 
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Edad: $edad años',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center, 
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Quirk: $quirk',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center, 
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
