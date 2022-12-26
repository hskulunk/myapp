import 'package:flutter/material.dart';
import '../screen_widgets/ayarlar_ekrani.dart';
import '../screen_widgets/tabs_ekrani.dart';
import '../screen_widgets/yemek_detayi_ekrani.dart';
import 'screen_widgets/yemek_kategorileri_ekrani.dart';

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
        '/': (context) => TabEkrani(),
        YemekKategorileriEkrani.routeName: ((context) =>
            YemekKategorileriEkrani()),
        YemekDetayiEkrani.routeName: (context) => YemekDetayiEkrani(),
        AyarlarEkrani.routeName: (context) => AyarlarEkrani(),
      },
    );
  }
}
