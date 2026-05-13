import 'package:flutter/material.dart';

class Esqueleto extends StatelessWidget {
  const Esqueleto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
              Container(
            width: 250,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 50),

                const Text(
                  "MI MUSICA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                _crearOpcionMenu(context, Icons.home, "Inicio"),
                _crearOpcionMenu(context, Icons.search, "Buscar"),
                _crearOpcionMenu(context, Icons.library_music, "Tu biblioteca"),
                _crearOpcionMenu(context, Icons.star, "Favoritos"),
                _crearOpcionMenu(context, Icons.account_circle, "Cuenta"),
                _crearOpcionMenu(context, Icons.settings, "Configuracion"),
              ],
            ),
          ),
          Expanded(
            child:Container(
              color: const Color(0xFFFFFFFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Escuchadas Recientemente",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                   Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(80),
              children: [
                _crearCardAlbum(context, "Musica 1", Colors.red),
                _crearCardAlbum(context, "Musica 2", Colors.blue),
                _crearCardAlbum(context, "Musica 3", Colors.green),
                _crearCardAlbum(context, "Musica 4", Colors.orange),
                _crearCardAlbum(context, "Musica 5", Colors.deepPurple),
                _crearCardAlbum(context, "Musica 6", Colors.pink),
              ],
            ),
          ),
                ],
              ),
            ),
          ),
              ],
            ),
          ),      
         const BarraReproductor(),
        ],        
      ),   
    );
  }
  Widget  _crearOpcionMenu(context, IconData icono, String texto) {
  return ListTile(
    leading: Icon(icono, color: Colors.white),
    title: Text(texto, style: const TextStyle(color: Colors.white)),
    onTap: () {
      print("Navegando a la seccion: $texto");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Entrando a: $texto"),
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.blueGrey,
          ),
       );
     },
   ); 
  }
  Widget _crearCardAlbum(context, String titulo, Color colorFondo) {
  return Card(
    color: colorFondo,
    child: Center(
      child:InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Reproduciendo: $titulo"),
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.blueGrey,
          ),
        );
       },
        child: Center(
        child:Text(
        titulo,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
         ),
        ),
       ),
      ) ,
     ),
    ); 
  }
}

class BarraReproductor extends StatefulWidget {
  const BarraReproductor({super.key});

  @override
  State<BarraReproductor> createState() => _BarraReproductorState();
}

class _BarraReproductorState extends State<BarraReproductor> {
  bool estaReproduciendo = false;
  double nivelVolumen = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: const Color(0xFF181818),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.music_note, color: Colors.white),
              SizedBox(width: 10),
              Text("Rock 80s mix", style: TextStyle(color: Colors.white)),
            ],
          ),
          IconButton(
            iconSize: 50,
            icon: Icon(
              estaReproduciendo
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_fill,
              color: Colors.green,
            ),
            onPressed: () {
              setState(() {
                estaReproduciendo = !estaReproduciendo;
              });
              print("Estado reproduccion: $estaReproduciendo");
            },
          ),
          Row(
            children: [
              const Icon(Icons.volume_up, color: Colors.grey, size: 20),
              const SizedBox(width: 8),
              SizedBox(
                width: 160,
                child: Slider(
                  value: nivelVolumen,
                  min: 0,
                  max: 100,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  onChanged: (nuevoValor) {
                    setState(() {
                      nivelVolumen = nuevoValor;
                    });
                    print("Volumen al: $nivelVolumen");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
