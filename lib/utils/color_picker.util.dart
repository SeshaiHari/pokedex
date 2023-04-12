import 'package:flutter/material.dart';

Color chooseColorFromType(String type) {
  switch (type) {
    case 'Grass':
      return Colors.greenAccent;

    case "Fire":
      return Colors.redAccent;

    case "Water":
      return Colors.blueAccent;

    case "Poison":
      return Colors.deepPurpleAccent;

    case "Electric":
      return Colors.amber;

    case "Rock":
      return Colors.blueGrey;

    case "Ground":
      return Colors.brown;

    case "Psychic":
      return Colors.indigo;
    case "Fighting":
      return Colors.orangeAccent;
    case "Bug":
      return Colors.lightGreenAccent;

    case "Normal":
      return Colors.black26;
    default:
      return Colors.pink;
  }
}
