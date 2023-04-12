import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  PokemonDetailScreen(this.pokemonDetail, this.color, this.heroTag,
      {super.key});
  final pokemonDetail;
  final Color color;
  final int heroTag;

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: widget.color,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Colors.white, size: 30)),
            ),
            Positioned(
                top: 120,
                left: 20,
                child: Text(
                  widget.pokemonDetail['name'],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
            Positioned(
                top: 150,
                right: 20,
                child: Text(
                  '#${widget.pokemonDetail['id']}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            Positioned(
                top: 170,
                left: 20,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.black26),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                    child: Text(
                      widget.pokemonDetail['type'].join(', '),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            Positioned(
              top: height * 0.23,
              right: -10,
              child: Image.asset(
                'images/pokeball.png',
                height: 170,
                fit: BoxFit.fitHeight,
                opacity: const AlwaysStoppedAnimation(0.5),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  width: width,
                  height: height * 0.6,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: width * 0.3,
                                  child: const Text("Name",
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 18))),
                              Container(
                                  child: Text(widget.pokemonDetail['name'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: width * 0.3,
                                  child: const Text("Height",
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 18))),
                              Container(
                                  child: Text(widget.pokemonDetail['height'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: width * 0.3,
                                  child: const Text("Weight",
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 18))),
                              Container(
                                  child: Text(widget.pokemonDetail['weight'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: width * 0.3,
                                  child: const Text("Spawn Time",
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 18))),
                              Container(
                                  child: Text(
                                      widget.pokemonDetail['spawn_time'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: width * 0.3,
                                  child: const Text("Weaknesses",
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 18))),
                              Expanded(
                                  child: Text(
                                      widget.pokemonDetail['weaknesses']
                                          .join(", "),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: width * 0.3,
                                    child: Text("Evolution",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 18))),
                                widget.pokemonDetail['next_evolution'] != null
                                    ? SizedBox(
                                        height: 20,
                                        width: width * 0.55,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: widget
                                                .pokemonDetail['next_evolution']
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Text(
                                                    widget.pokemonDetail[
                                                            'next_evolution']
                                                        [index]['name'],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              );
                                            }),
                                      )
                                    : Text('Maxed Out',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                              ],
                            ))
                      ],
                    ),
                  )),
            ),
            Positioned(
                top: height * 0.21,
                left: (width / 2) - 100,
                child: Hero(
                  tag: widget.heroTag,
                  child: CachedNetworkImage(
                      imageUrl: widget.pokemonDetail['img'],
                      height: 200,
                      fit: BoxFit.fitHeight),
                ))
          ],
        ));
  }
}
