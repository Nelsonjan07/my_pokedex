import 'package:flutter/material.dart';
import 'package:my_pokedex/features/home/home_screen.dart';

void main(){
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
