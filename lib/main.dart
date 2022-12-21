// //NOT: Besinci olarak da main widget a anasayfa, tanimlanmis Ekran Kategorisi seklinde geliyor
// // Boylece anasayfayi tanimlamis oluyoruz (5)

// import 'package:flutter/material.dart';
// import './yemek_kategorileri_ekrani.dart';
// import './ekran_kategorisi.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Yemekler',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
//             .copyWith(secondary: Colors.amber),
//         canvasColor: Color.fromARGB(255, 172, 167, 121),
//         fontFamily: 'Raleway',
//         textTheme: ThemeData.light().textTheme.copyWith(
//               bodyText1: TextStyle(
//                 color: Color.fromARGB(20, 51, 51, 1),
//               ),
//               bodyText2: TextStyle(
//                 color: Color.fromARGB(20, 51, 51, 1),
//               ),
//               headline6: TextStyle(
//                 fontSize: 20, //title == headline6 ?
//                 fontFamily: 'RobotoCondensed',
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//       ),
//       // home: EkranKategorisi(), // this is the first screen
//       initialRoute: '/', //default is '/',
//       routes: {
//         '/': (context) => EkranKategorisi(),
//         YemekKategorileriEkrani.routeName:
//             ((context) => // add a static property
//                 YemekKategorileriEkrani()), // define  route is a screen  (8)
//         // that is used for second page handles a function (context)
//       },
//     );
//   }
// }

// //version 2
// import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/screen_widgets/yemek_detayi_ekrani.dart';
// import 'screen_widgets/yemek_kategorileri_ekrani.dart';
// import 'screen_widgets/ekran_kategorisi.dart';
// //import 'screen_widgets/yemek_detayi_ekrani.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Yemekler',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
//             .copyWith(secondary: Colors.amber),
//         canvasColor: Color.fromARGB(255, 172, 167, 121),
//         fontFamily: 'Raleway',
//         textTheme: ThemeData.light().textTheme.copyWith(
//               bodyText1: TextStyle(
//                 color: Color.fromARGB(20, 51, 51, 1),
//               ),
//               bodyText2: TextStyle(
//                 color: Color.fromARGB(20, 51, 51, 1),
//               ),
//               headline6: TextStyle(
//                 fontSize: 20,
//                 fontFamily: 'RobotoCondensed',
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) =>
//             EkranKategorisi(), // routes is a new widget for viewing pages and (2)
//         //this is the main screen
//         YemekKategorileriEkrani.routeName: ((context) =>
//             YemekKategorileriEkrani()), // YemekKategorileriEkrani.routeName == '/yemek-kategorileri' (6)
//         YemekDetayiEkrani.routeName: (context) =>
//             YemekDetayiEkrani(), // adress to the
//         //main.dart (onemli-3)
//       },
//       // onGenerateRoute: (settings) {
//       //   print(settings.arguments);
//       //   return MaterialPageRoute(
//       //     builder: (context) => EkranKategorisi(),
//       //   );
//       // },
//     );
//   }
// }

//version 3
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screen_widgets/ayarlar_ekrani.dart';
import '../screen_widgets/tabs_ekrani.dart';
import '../screen_widgets/yemek_detayi_ekrani.dart';
import 'screen_widgets/yemek_kategorileri_ekrani.dart';
//import 'screen_widgets/ekran_kategorisi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yemekler',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.amber),
        canvasColor: Color.fromARGB(255, 242, 236, 235),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabEkrani(), // modify it for the tab_screen (7)
        YemekKategorileriEkrani.routeName: ((context) =>
            YemekKategorileriEkrani()),
        YemekDetayiEkrani.routeName: (context) => YemekDetayiEkrani(),
        AyarlarEkrani.routeName: (context) =>
            AyarlarEkrani(), // add widget on a main dart file
      },
    );
  }
}
