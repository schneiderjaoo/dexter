import 'package:flutter/material.dart';
import 'telas/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/dex.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Container(
              width: 100, // Largura do círculo invisível
              height: 100, // Altura do círculo invisível
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(0, 0, 0, 0),  // Cor transparente
              ),
            ),
          ),
        ),
      ),
    );
  }
}
