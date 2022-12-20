// //NOT: Ilk olarak bu modelin olusturulmasi gerekiyor (1)

// import 'package:flutter/material.dart'; // define Color type

// class Kategory {
//   final String id;
//   final String title;
//   final Color color;

//   const Kategory({
//     // const means that cant changed after the object is created
//     @required this.id,
//     @required this.title,
//     this.color = Colors.orange, // default color is orange
//   });
// }

// // version 2

// import 'package:flutter/material.dart';

// class Kategory {
//   final String id;
//   final String title;
//   final Color color;

//   const Kategory({
//     @required this.id,
//     @required this.title,
//     this.color = Colors.orange,
//   });
// }

// version 3

import 'package:flutter/material.dart';

class Kategory {
  final String id;
  final String title;
  final Color color;

  const Kategory({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}
