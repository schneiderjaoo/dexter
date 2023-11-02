import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> pokemonList = [
    'Pikachu',
    'Bulbasaur',
    'Charmander',
    'Squirtle',
    'Eevee',
    'Snorlax',
    // Adicione mais nomes de Pokémon conforme necessário
  ];

  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList.addAll(pokemonList);
  }

  void filterPokemonList(String query) {
    filteredList.clear();
    if (query.isEmpty) {
      filteredList.addAll(pokemonList);
    } else {
      query = query.toLowerCase();
      filteredList.addAll(pokemonList.where((pokemon) => pokemon.toLowerCase().contains(query)));
    }
    setState(() {});
  }

  void addPokemon(String name) {
    if (name.isNotEmpty) {
      setState(() {
        pokemonList.add(name);
        filterPokemonList(''); // Atualiza a lista filtrada
      });
    }
  }

  void removePokemon(String name) {
    setState(() {
      pokemonList.remove(name);
      filterPokemonList(''); // Atualiza a lista filtrada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255), // Cor vermelha na AppBar
        title: Text('Pokédex'),
      ),
      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredList[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                removePokemon(filteredList[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              final nameController = TextEditingController();
              return AlertDialog(
                title: Text('Adicionar Pokémon'),
                content: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nome do Pokémon'),
                ),
                actions: [
                  TextButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Adicionar'),
                    onPressed: () {
                      addPokemon(nameController.text);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Color.fromARGB(255, 172, 0, 0), // Cor azul para o fundo do ícone de adicionar
        child: Icon(
          Icons.add,
          color: Colors.white, // Cor do ícone
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 138, 198, 247),
    );
  }
}
