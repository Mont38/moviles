import 'package:app1/screeen/responsive.dart';
import 'package:flutter/material.dart';

import '../models/pokemon_model.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokeDetail({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        title: Text(pokemon.name),
      ),
      body: Stack(
        children: [
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(41, 14, 119, 204)),
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

  Widget _mobileWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / .5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.03,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                      tag: pokemon.img,
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(pokemon.img))),
                      )),
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 254, 254)),
                ),
                Text("Height: ${pokemon.height}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 246, 152, 11),
                    )),
                Text("Weight: ${pokemon.weight}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 147, 243, 203),
                    )),
                Text(" "),
              ],
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Color.fromARGB(90, 248, 248, 248),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 200,
                                  width: 150,
                                  color: Color.fromARGB(255, 185, 63, 61),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Types",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(222, 9, 9, 9)),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: pokemon.type!
                                            .map((t) => Column(
                                                  children: [
                                                    FilterChip(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                185, 63, 61),
                                                        label: Text(t,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        onSelected: (b) {}),
                                                  ],
                                                ))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 3),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: 150,
                                  color: Color.fromARGB(255, 54, 165, 244),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Weakness",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: pokemon.weaknesses!
                                            .map((t) => FilterChip(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 54, 165, 244),
                                                label: Text(
                                                  t,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                onSelected: (b) {}))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.nextEvolution == null
                              ? <Widget>[]
                              : pokemon.nextEvolution!
                                  .map((n) => FilterChip(
                                        backgroundColor: Colors.amber,
                                        label: Text(
                                          n.name,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onSelected: (b) {},
                                      ))
                                  .toList(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );

  Widget _desktopWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.35,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.01,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    pokemon.name,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: ${pokemon.height}",
                      style: TextStyle(
                        fontSize: 15.0,
                      )),
                  Text("Weight: ${pokemon.weight}",
                      style: TextStyle(
                        fontSize: 15.0,
                      )),
                  Text(""),
                  Text(
                    "Types",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pokemon.type!
                        .map((t) => FilterChip(
                            backgroundColor: Colors.green,
                            label: Text(
                              t,
                            ),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Weakness",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pokemon.weaknesses!
                        .map((t) => FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(
                              t,
                              style: TextStyle(color: Colors.white),
                            ),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text(""),
                  Text("Next Evolution",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pokemon.nextEvolution == null
                        ? <Widget>[
                            Text(
                              "This is the final form",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber.shade700),
                            )
                          ]
                        : pokemon.nextEvolution!
                            .map((n) => FilterChip(
                                  backgroundColor: Colors.amber.shade700,
                                  label: Text(
                                    n.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onSelected: (b) {},
                                ))
                            .toList(),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.all(37.0),
                child: Container(
                  height: 225.0,
                  width: 225.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
                )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/pokebola.png'))),
                )),
          )
        ],
      );

  Widget _tabletWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.35,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.01,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    pokemon.name,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: ${pokemon.height}",
                      style: TextStyle(
                        fontSize: 15.0,
                      )),
                  Text("Weight: ${pokemon.weight}",
                      style: TextStyle(
                        fontSize: 15.0,
                      )),
                  Text(""),
                  Text(
                    "Types",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pokemon.type!
                        .map((t) => FilterChip(
                            backgroundColor: Colors.green,
                            label: Text(
                              t,
                            ),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Weakness",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pokemon.weaknesses!
                        .map((t) => FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(
                              t,
                              style: TextStyle(color: Colors.white),
                            ),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text(""),
                  Text("Next Evolution",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pokemon.nextEvolution == null
                        ? <Widget>[
                            Text(
                              "This is the final form",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber.shade700),
                            )
                          ]
                        : pokemon.nextEvolution!
                            .map((n) => FilterChip(
                                  backgroundColor: Colors.amber.shade700,
                                  label: Text(
                                    n.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onSelected: (b) {},
                                ))
                            .toList(),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.all(37.0),
                child: Container(
                  height: 225.0,
                  width: 225.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
                )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/pokebola.png'))),
                )),
          )
        ],
      );
}
