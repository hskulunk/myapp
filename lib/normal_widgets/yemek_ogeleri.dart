//import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/models/yemek.dart';
// import '../screen_widgets/yemek_detayi_ekrani.dart';
// //import '../models/yemek.dart';

// class YemekOgeleri extends StatelessWidget {
//   final String id; // add a unique identifier (onemli-4)
//   final String title;
//   final String imageUrl;
//   final int duration;
//   final Complexity complexity; // is defined in yemek.dart
//   final Affordability affordability; // is defined in yemek.dart

//   const YemekOgeleri({
//     @required this.id,
//     @required this.title,
//     @required this.imageUrl,
//     @required this.duration,
//     @required this.complexity,
//     @required this.affordability,
//   });

//   String get ComplexityText {
//     // we use get function, because complexity is a
//     // enum and we should define each text for the selections
//     // we can do that as below
//     // if (complexity == Complexity.Simple) {
//     //   return 'Simple';
//     // }
//     // if (complexity == Complexity.Challenging) {
//     //   return 'Challenging';
//     // }
//     // if (complexity == Complexity.Hard) {
//     //   return 'Hard';
//     // }

//     //or

//     switch (complexity) {
//       case Complexity.Simple:
//         return 'Simple';
//         break;
//       case Complexity.Challenging:
//         return 'Challenging';
//         break;
//       case Complexity.Hard:
//         return 'Hard';
//         break;
//       default:
//         return 'Unknown';
//     }
//   }

//   String get affordabilityText {
//     // create a get function for this enum
//     switch (affordability) {
//       case Affordability.Affordable:
//         return 'Affordable';
//         break;
//       case Affordability.Pricey:
//         return 'Pricey';
//         break;
//       case Affordability.Luxurious:
//         return 'Luxurious';
//         break;
//       default:
//         return 'Unknown';
//     }
//   }

//   void yemekSec(BuildContext context) {
//     // arrange for the yemek_detayi_ekrani
//     Navigator.of(context).pushNamed(
//       YemekDetayiEkrani.routeName, // if we wanto to used pushNamed we need to
//       // give this route a path  (static const property) (onemli-1)
//       arguments:
//           id, // for arguments we need a unique identifier (we can use id)
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (() => yemekSec(context)), // defined above
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 4,
//         margin: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                   ),
//                   child: Image.network(
//                     imageUrl, // which is defined above
//                     height: 250,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   // positioned the child widget
//                   bottom: 20,
//                   right: 10,
//                   child: Container(
//                     width: 300,
//                     color: Colors.black54,
//                     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                     child: Text(
//                       title, //title is defined above
//                       style: TextStyle(
//                         fontSize: 26,
//                         color: Colors.white,
//                       ),
//                       softWrap: true, // if text is too long it ll wrapped
//                       overflow:
//                           TextOverflow.fade, // fade out if needs to exceed
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment:
//                       MainAxisAlignment.spaceAround, // space between rows
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.schedule, // the clock picture
//                         ),
//                         SizedBox(
//                           width: 6,
//                         ),
//                         Text(
//                           '$duration min',
//                           style: TextStyle(
//                             fontSize: 17,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.work, // the workbasket picture
//                         ),
//                         SizedBox(
//                           width: 6,
//                         ),
//                         Text(
//                           ComplexityText, // defined above
//                           style: TextStyle(
//                             fontSize: 17,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.attach_money, // the currency picture
//                         ),
//                         SizedBox(
//                           width: 6,
//                         ),
//                         Text(
//                           affordabilityText, // defined above
//                           style: TextStyle(
//                             fontSize: 17,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

//version 4
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/yemek.dart';
import '../screen_widgets/yemek_detayi_ekrani.dart';

class YemekOgeleri extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem; // new function (3) if result is not null
  //that means if we press on the trash bin (pop function) in YemekDetayiEkrani

  const YemekOgeleri({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeItem, //new function (3) if result is not null
    //that means if we press on the trash bin (pop function) in YemekDetayiEkrani
  });

  String get ComplexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void yemekSec(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      // pushnamed means when push names on the YemekKategorileriEkrani,
      // YemekDetayiEkrani will be shown
      YemekDetayiEkrani.routeName,
      arguments: id,
    )
        .then(
      // then means after showing YemekDetayiEkrani, show result (2)
      (result) {
        // after reached the page after popping then the screen shows the
        // yemekId (result) which is defined in YemekDetayiEkrani
        if (result != null) {
          // if the result is not null remove the result (yemekId)
          removeItem(result);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => yemekSec(context)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '$duration min',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          ComplexityText,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          affordabilityText,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
