import 'package:flutter/material.dart';
import '../databases/dummy_data.dart'; //import
import '../models/yemek.dart'; //import
import '../screen_widgets/ayarlar_ekrani.dart';
import '../screen_widgets/tabs_ekrani.dart';
import '../screen_widgets/yemek_detayi_ekrani.dart';
import 'screen_widgets/yemek_kategorileri_ekrani.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // change stateless to stateful widget because we d like to reach AyarlarEkrani
  // and KategorilerEkrani at the same time (1)
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filtreler = {
    // create a map of strings that are boolean called
    // _filtreler, add a list of properties and initial values (false) (2)
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Yemek> _uygunYemekler = DUMMY_MEALS; // uygunYemekler should be updated,
  // based on the filters so defined here as a list of Yemek (defined properties)
  // and default values are from DUMMY_MEALS (8)

  // uygunYemekler should be passed into YemekKategorileriEkrani below (10)

  void _filtreAyarla(Map<String, bool> filtrelenmisVeri) {
    // create a method that composed
    // of map of strings which are boolean called filtrelenmis veri
    //that method should be called inside the ayarlarekrani. For activating a function
    // we can take an advantage of route methods (3)
    //We update tyhe filters so we use set state method (7)
    setState(() {
      _filtreler = filtrelenmisVeri; // which now defined exactly the same order

      _uygunYemekler = DUMMY_MEALS.where((yemek) {
        // create a filter based on a
        // specified condition (9)
        if (_filtreler['gluten'] && !yemek.isGlutenFree) {
          // set the filters
          return false; // here it means if the meal doesnt include glutenfree property
          // exclude the meal (14)
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
        return true; // otherwise show all meal in the YemekKategorileriEkrani (14)
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
            YemekKategorileriEkrani(_uygunYemekler)), // passed to method
        // (function) above  (10)
        YemekDetayiEkrani.routeName: (context) => YemekDetayiEkrani(),
        AyarlarEkrani.routeName: (context) =>
            AyarlarEkrani(_filtreler, _filtreAyarla), //
        // now filtreAyarla method (also function) is available for ayarlarEkrani (4)
        // now pass the _filtreler in the AyarlarEkrani (18)
      },
    );
  }
}
