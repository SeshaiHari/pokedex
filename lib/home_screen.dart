import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/detail_screen.dart';
import 'package:pokedex/utils/color_picker.util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  List pokedex = [];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        body: Stack(
          children: [
            Positioned(
                right: -50,
                top: -30,
                child: Image.asset('images/pokeball.png',
                    width: 200, fit: BoxFit.fitHeight)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 90),
                const Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Pokedex',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 30),
                pokedex.isNotEmpty
                    ? Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.4),
                            itemCount: pokedex.length,
                            itemBuilder: (context, index) {
                              var type = pokedex[index]['type'][0];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => PokemonDetailScreen(
                                              pokedex[index],
                                              chooseColorFromType(type),
                                              index)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: chooseColorFromType(type),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: -10,
                                            right: -10,
                                            child: Image.asset(
                                              'images/pokeball.png',
                                              height: 80,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                          Positioned(
                                              top: 20,
                                              left: 10,
                                              child: Text(
                                                pokedex[index]['name'],
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )),
                                          Positioned(
                                              top: 50,
                                              left: 10,
                                              child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.black26,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8,
                                                            top: 4,
                                                            bottom: 4),
                                                    child: Text(
                                                      type.toString(),
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ))),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Hero(
                                              tag: index,
                                              child: CachedNetworkImage(
                                                imageUrl: pokedex[index]['img'],
                                                height: 100,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              );
                            }),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ],
        ));
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');

    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];

        setState(() {});
      }
    });
  }
}
