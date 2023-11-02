import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Principal'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/dex.jpg'),
            fit: BoxFit.cover, 
          ),
        ),
        child: Center(
          child: Text(
            'Bem-vindo ao meu aplicativo Flutter!',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}

