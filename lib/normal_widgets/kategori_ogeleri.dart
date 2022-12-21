// // NOT: Ucuncu olarak Ekrandaki kategori ogeleri, basligi renkleri ve sekli widget olarak
// // tanimlaniyor (4)

// import 'package:flutter/material.dart';
// //import './yemek_kategorileri_ekrani.dart';

// class KategoriOgeleri extends StatelessWidget {
//   // KategoriOgeleri({Key key, this.baslik, this.renk}) : super(key: key); otomatik gelen bu veriyi sil
//   final String id;
//   final String title;
//   final Color color;

//   KategoriOgeleri(
//     this.id,
//     this.title,
//     this.color,
//   );

//   void kategoriSec(BuildContext icerik) {
//     Navigator.of(icerik).pushNamed(
//         //modify for route arguments
//         // Navigator is a class when you swipe between screens
//         '/yemek-kategorileri',
//         arguments: {
//           'id': id,
//           'title': title,
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       // for tapping functions we need Inkwell
//       //like a Gesture detector
//       onTap: () => kategoriSec(context), // tabbable now
//       splashColor: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.circular(15),
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         child: Text(
//           title,
//           style: Theme.of(context).textTheme.headline6,
//         ),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               color.withOpacity(0.7),
//               color,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//     );
//   }
// }

// //version 2

// import 'package:flutter/material.dart';
// //import 'package:flutter_complete_guide/yemek_kategorileri_ekrani.dart';

// class KategoriOgeleri extends StatelessWidget {
//   final String id;
//   final String title;
//   final Color color;

//   KategoriOgeleri(
//     this.id,
//     this.title,
//     this.color,
//   );

//   void kategoriSec(BuildContext icerik) {
//     Navigator.of(icerik).pushNamed('/yemek-kategorileri', arguments: {
//       // define routes and
//       //arguments  (1)
//       // pushed named defined like this
//       'id': id, // id is define above
//       'title': title, // id is define above
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => kategoriSec(context),
//       splashColor: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.circular(15),
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         child: Text(
//           title,
//           style: Theme.of(context).textTheme.headline6,
//         ),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               color.withOpacity(0.7),
//               color,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//     );
//   }
// }

//version 4

import 'package:flutter/material.dart';

class KategoriOgeleri extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  KategoriOgeleri(
    this.id,
    this.title,
    this.color,
  );

  void kategoriSec(BuildContext icerik) {
    Navigator.of(icerik).pushNamed('/yemek-kategorileri', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => kategoriSec(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
