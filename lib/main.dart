import 'package:flutter/material.dart';
import '../databases/dummy_data.dart';
import '../models/yemek.dart';
import '../screen_widgets/ayarlar_ekrani.dart';
import '../screen_widgets/tabs_ekrani.dart';
import '../screen_widgets/yemek_detayi_ekrani.dart';
import 'screen_widgets/yemek_kategorileri_ekrani.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filtreler = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Yemek> _uygunYemekler = DUMMY_MEALS;
  void _filtreAyarla(Map<String, bool> filtrelenmisVeri) {
    setState(() {
      _filtreler = filtrelenmisVeri;

      _uygunYemekler = DUMMY_MEALS.where((yemek) {
        if (_filtreler['gluten'] && !yemek.isGlutenFree) {
          return false;
        }
        if (_filtreler['lactose'] && !yemek.isLactoseFree) {
          return false;
        }
        if (_filtreler['vegan'] && !yemek.isVegan) {
          return false;
        }
        if (_filtreler['vegeterian'] && !yemek.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
            YemekKategorileriEkrani(_uygunYemekler)),
        YemekDetayiEkrani.routeName: (context) => YemekDetayiEkrani(),
        AyarlarEkrani.routeName: (context) =>
            AyarlarEkrani(_filtreler, _filtreAyarla),
      },
    );
  }
}
