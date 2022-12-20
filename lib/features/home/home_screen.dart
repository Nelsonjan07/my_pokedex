import 'dart:convert';

import 'package:my_pokedex/features/information/pokemon_color_type.dart';
import 'package:my_pokedex/features/information/pokemon_info_page.dart';
import 'package:my_pokedex/utilities/color.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi = "https://pokeapi.co/api/v2/pokemon?limit=153&offset=0";
  late List pokedex;

  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pokedex'),
        backgroundColor: kAppBarColor,
      ),
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 10,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.3,
                          ),
                          itemCount: pokedex.length,
                          itemBuilder: (context, index) {
                            var type = pokedex[index]['type'][0];
                            return InkWell(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 12,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: getColorByType(type),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Image.asset(
                                          'images/pokeball.png',
                                          height: 100,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        bottom: -10,
                                        right: -10,
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 10,
                                        child: Text(
                                          pokedex[index]['name'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Container(
                                          child: Padding(
                                            child: Text(
                                              type.toString(),
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            padding: EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              top: 4,
                                              bottom: 4,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            color: Colors.black26,
                                          ),
                                        ),
                                        top: 45,
                                        left: 20,
                                      ),
                                      Positioned(
                                        child: CachedNetworkImage(
                                          imageUrl: pokedex[index]['img'],
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                        bottom: 5,
                                        right: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                // Todo Navigate to new detail screen
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PokemonInfoPage(
                                              pokemonInfo: pokedex[index],
                                              color: getColorByType(type),
                                              heroTag: index,
                                            )));
                              },
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com", "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodeJsonData = jsonDecode(value.body);
        pokedex = decodeJsonData['pokemon'];
        setState(() {});
      }
    });
  }
}
