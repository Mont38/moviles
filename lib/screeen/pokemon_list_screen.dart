import 'dart:convert';

import 'package:app1/screeen/pokemon_detail_screen.dart';
import 'package:app1/screeen/responsive.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon_model.dart';

class PokemonListView extends StatefulWidget {
  @override
  PokemonListViewState createState() {
    return new PokemonListViewState();
  }
}

class PokemonListViewState extends State<PokemonListView> {
  Uri url = Uri.parse(
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

  PokeHub? pokeHub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodedJson);
    print(pokeHub!.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        title: Text("Pokemons"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/fondo_pokebola2.jpg"),
              opacity: 0.7,
              fit: BoxFit.cover,
            )),
            child: Responsive(
              mobile: _mobileWidget(context),
              desktop: _desktopWidget(context),
              tablet: _tabletWidget(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _mobileWidget(BuildContext context) {
    return pokeHub == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.count(
            crossAxisCount: 2,
            children: pokeHub!.pokemon!
                .map((poke) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PokeDetail(
                                        pokemon: poke,
                                      )));
                        },
                        child: Hero(
                          tag: poke.img,
                          child: Card(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(poke.img))),
                                ),
                                Text(
                                  poke.name,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
  }

  Widget _desktopWidget(BuildContext context) {
    return pokeHub == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.count(
            crossAxisCount: 2,
            children: pokeHub!.pokemon!
                .map((poke) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PokeDetail(
                                        pokemon: poke,
                                      )));
                        },
                        child: Hero(
                          tag: poke.img,
                          child: Card(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(poke.img))),
                                ),
                                Text(
                                  poke.name,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
  }

  Widget _tabletWidget(BuildContext context) {
    return pokeHub == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.count(
            crossAxisCount: 2,
            children: pokeHub!.pokemon!
                .map((poke) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PokeDetail(
                                        pokemon: poke,
                                      )));
                        },
                        child: Hero(
                          tag: poke.img,
                          child: Card(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(poke.img))),
                                ),
                                Text(
                                  poke.name,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
  }
}
