// //NOT: Ikinci olarak bu modelin olusturulmasi gerekiyor (2)
// import 'package:flutter/foundation.dart';

// enum Complexity { Simple, Challenging, Hard }

// enum Affordability { Affordable, Pricey, Luxurious }

// class Yemek {
//   final String id;
//   final List<String> categories;
//   final String title;
//   final String imageUrl;
//   final List<String> ingredients;
//   final List<String> steps;
//   final int duration;
//   final Complexity complexity;
//   final Affordability affordability;
//   final bool isGlutenFree;
//   final bool isLactoseFree;
//   final bool isVegan;
//   final bool isVegetarian;

//   const Yemek({
//     @required this.id,
//     @required this.categories,
//     @required this.title,
//     @required this.imageUrl,
//     @required this.ingredients,
//     @required this.steps,
//     @required this.duration,
//     @required this.complexity,
//     @required this.affordability,
//     @required this.isGlutenFree,
//     @required this.isLactoseFree,
//     @required this.isVegan,
//     @required this.isVegetarian,
//   });
// }

// //version 2

// import 'package:flutter/foundation.dart';

// enum Complexity { Simple, Challenging, Hard }

// enum Affordability { Affordable, Pricey, Luxurious }

// class Yemek {
//   final String id;
//   final List<String> categories;
//   final String title;
//   final String imageUrl;
//   final List<String> ingredients;
//   final List<String> steps;
//   final int duration;
//   final Complexity complexity;
//   final Affordability affordability;
//   final bool isGlutenFree;
//   final bool isLactoseFree;
//   final bool isVegan;
//   final bool isVegetarian;

//   const Yemek({
//     @required this.id,
//     @required this.categories,
//     @required this.title,
//     @required this.imageUrl,
//     @required this.ingredients,
//     @required this.steps,
//     @required this.duration,
//     @required this.complexity,
//     @required this.affordability,
//     @required this.isGlutenFree,
//     @required this.isLactoseFree,
//     @required this.isVegan,
//     @required this.isVegetarian,
//   });
// }

//version 3

import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Yemek {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Yemek({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
