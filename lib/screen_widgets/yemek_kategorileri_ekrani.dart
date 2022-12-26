// //NOT: Yemek kategorileri hakkinda yeni bir ekran olusturduk. (6)

// import 'package:flutter/material.dart';
// import './dummy_data.dart';

// class YemekKategorileriEkrani extends StatelessWidget {
//   static const routeName = '/yemek-kategorileri'; // add a static constructor

//   // final String kategoryId;
//   // final String kategoryBaslik;

//   // YemekKategorileriEkrani(this.kategoryId, this.kategoryBaslik);

//   // const YemekKategorileriEkrani({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final routeArgs = // create route arguments (9)
//         ModalRoute.of(context).settings.arguments as Map<String, String>;
//     final kategoryBaslik = routeArgs['title'];
//     final kategoryId = routeArgs['id'];
//     final yemekKategorisi = DUMMY_MEALS.where((Yemek) {
//       return Yemek.categories.contains(kategoryId);
//     });
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(kategoryBaslik),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           return Text(yemekKategorisi[index].title);
//         },
//         itemCount: yemekKategorisi.length,
//       ),
//     );
//   }
// }

// //version 2
// import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/normal_widgets/yemek_ogeleri.dart';
// import '../databases/dummy_data.dart';

// class YemekKategorileriEkrani extends StatelessWidget {
//   static const routeName =
//       '/yemek-kategorileri'; // naming of YemekKategorileriEkrani.routename (5)

//   @override
//   Widget build(BuildContext context) {
//     final routeArgs = //make a connection of arguments with '/yemek-kategorileri'
//         //they are map of strings (title and id )
//         ModalRoute.of(context).settings.arguments as Map<String, String>; // (3)
//     final kategoryBaslik =
//         routeArgs['title']; // define a property of arguments in route args  (4)
//     final kategoryId =
//         routeArgs['id']; // define a property of arguments in route args   (4)

//     final yemekKategorisi = DUMMY_MEALS.where((Yemek) {
//       return Yemek.categories.contains(kategoryId);
//     }).toList(); // create a list of kategoryIds'  (7)
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(kategoryBaslik),
//       ),
//       body: ListView.builder(
//         // (8)
//         itemBuilder: (ctx, index) {
//           return YemekOgeleri(
//             // modify it (10)
//             id: yemekKategorisi[index]
//                 .id, // add a id of yemek on yemek_kategorileri
//             //ekrani (onemli-4)
//             title: yemekKategorisi[index].title,
//             imageUrl: yemekKategorisi[index].imageUrl,
//             duration: yemekKategorisi[index].duration,
//             affordability: yemekKategorisi[index].affordability,
//             complexity: yemekKategorisi[index].complexity,
//           ); // show titles with the same id
//         },
//         itemCount:
//             yemekKategorisi.length, //compute the name of yemek kategorisi
//       ),
//     );
//   }
// }

//version 4
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/normal_widgets/yemek_ogeleri.dart';
import '../databases/dummy_data.dart';
import '../models/yemek.dart';

class YemekKategorileriEkrani extends StatefulWidget {
  static const routeName = '/yemek-kategorileri';

  @override
  State<YemekKategorileriEkrani> createState() =>
      _YemekKategorileriEkraniState();
}

class _YemekKategorileriEkraniState extends State<YemekKategorileriEkrani> {
  String kategoryBaslik;
  List<Yemek> yemekGoster;
  var _initialDataYukleniyor = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_initialDataYukleniyor) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      kategoryBaslik = routeArgs['title'];
      final kategoryId = routeArgs['id'];

      yemekGoster = DUMMY_MEALS.where((Yemek) {
        return Yemek.categories.contains(kategoryId);
      }).toList();
      _initialDataYukleniyor = true;
    }

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    kategoryBaslik = routeArgs['title'];
    final kategoryId = routeArgs['id'];

    yemekGoster = DUMMY_MEALS.where((Yemek) {
      return Yemek.categories.contains(kategoryId);
    }).toList();
    _initialDataYukleniyor = true;

    super.didChangeDependencies();
  }

  void _yemekSil(String yemekId) {
    setState(() {
      yemekGoster.removeWhere((yemek) => yemek.id == yemekId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kategoryBaslik),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return YemekOgeleri(
            id: yemekGoster[index].id,
            title: yemekGoster[index].title,
            imageUrl: yemekGoster[index].imageUrl,
            duration: yemekGoster[index].duration,
            affordability: yemekGoster[index].affordability,
            complexity: yemekGoster[index].complexity,
            removeItem: _yemekSil,
          );
        },
        itemCount: yemekGoster.length,
      ),
    );
  }
}
