import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screen_widgets/favori_ekrani.dart';
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
  List<Yemek> _favoriYemekler =
      []; // create an empty list of Yemek called _favoriYemekler (1)

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

  void _toggleFavoriler(String yemekId) {
    // toogle (sec, kilitle) favoriler method created (6)
    final mevcutIndex =
        _favoriYemekler.indexWhere((element) => element.id == yemekId);
    if (mevcutIndex >= 0) {
      setState(() {
        _favoriYemekler.removeAt(mevcutIndex);
      });
    } else {
      setState(() {
        _favoriYemekler.add(
          DUMMY_MEALS.firstWhere((element) => element.id == yemekId),
        );
      });
    } // each time the build method create entire screen which is not desirable thing
    // so we need state management (7)
  }

  //add another method which is a boolean (11)
  bool _isMealFavorite(String id) {
    return _favoriYemekler
        .any((element) => element.id == id); // create a boolean
    //string and pass to the YemekDetayiEkrani (11)
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
        '/': (context) => TabEkrani(_favoriYemekler), // forward _favoriYemekler
        //into a TabEkrani because TabEkrani has FavoriEkrani (2)
        YemekKategorileriEkrani.routeName: ((context) =>
            YemekKategorileriEkrani(_uygunYemekler)),
        YemekDetayiEkrani.routeName: (context) => YemekDetayiEkrani(
              _toggleFavoriler,
              _isMealFavorite,
            ), // passed the boolean (12)
        //past it to the YemekDetayiEkrani (8)
        AyarlarEkrani.routeName: (context) =>
            AyarlarEkrani(_filtreler, _filtreAyarla),
      },
    );
  }
}
