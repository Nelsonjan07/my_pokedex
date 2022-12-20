import 'package:flutter/material.dart';
import 'package:my_pokedex/utilities/color.dart';

Color getColorByType(type) {
  switch (type) {
    case 'Normal':
      return kNormalTypeColor;
    case 'Fire':
      return kFireTypeColor;
    case 'Water':
      return kWaterTypeColor;
    case 'Electric':
      return kElectricTypeColor;
    case 'Grass':
      return kGrassTypeColor;
    case 'Ice':
      return kIceTypeColor;
    case 'Fighting':
      return kFightingTypeColor;
    case 'Poison':
      return kPoisonTypeColor;
    case 'Ground':
      return kGroundTypeColor;
    case 'Flying':
      return kFlyingTypeColor;
    case 'Psychic':
      return kPsychicTypeColor;
    case 'Bug':
      return kBugTypeColor;
    case 'Rock':
      return kRockTypeColor;
    case 'Ghost':
      return kGhostTypeColor;
    case 'Dragon':
      return kDragonTypeColor;
    case 'Dark':
      return kDarkTypeColor;
    case 'Steel':
      return kSteelTypeColor;
    case 'Fairy':
      return kFairyTypeColor;
    default:
      return Colors.white;
  }
}
