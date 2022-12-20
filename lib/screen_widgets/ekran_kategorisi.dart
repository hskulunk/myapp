// // NOT: Dorduncu olarak, Ekran kategorisi tanimlaniyor. Burada tanimlanirken,
// // Scaffol icine Appbar, body ekleniyor. body nin icine DUMMY_CATEGORILER,
// // KategoriOgeleri nin ozellikleri ile geliyor (5)

// import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/kategori_ogeleri.dart';
// import './dummy_data.dart';

// class EkranKategorisi extends StatelessWidget {
//   // const EkranKategorisi({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Yemekler',
//         ),
//       ),
//       body: GridView(
//         padding: const EdgeInsets.all(25),
//         children: DUMMY_CATEGORIES // convert list to map and map to widget
//             .map(
//               (katData) => KategoriOgeleri(
//                 katData.id,
//                 katData.title,
//                 katData.color,
//               ),
//             )
//             .toList(),
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20,
//         ),
//       ),
//     );
//   }
// }

// // version 2
// import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/normal_widgets/kategori_ogeleri.dart';
// import '../databases/dummy_data.dart';

// class EkranKategorisi extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Yemekler',
//         ),
//       ),
//       body: GridView(
//         padding: const EdgeInsets.all(25),
//         children: DUMMY_CATEGORIES
//             .map(
//               (katData) => KategoriOgeleri(
//                 katData.id,
//                 katData.title,
//                 katData.color,
//               ),
//             )
//             .toList(),
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20,
//         ),
//       ),
//     );
//   }
// }

// version 3
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/normal_widgets/kategori_ogeleri.dart';
import '../databases/dummy_data.dart';

class EkranKategorisi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // NOTE: for the purpose of beauty
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(
    //       'Yemekler',
    //     ),
    //   ),
    //body:
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (katData) => KategoriOgeleri(
              katData.id,
              katData.title,
              katData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
    //);
  }
}
