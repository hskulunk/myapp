//Tab_screen is a stateful widget

import 'package:flutter/material.dart';
import '../normal_widgets/main_drawer.dart';
import '../screen_widgets/favori_ekrani.dart';
import '../screen_widgets/ekran_kategorisi.dart';

class TabEkrani extends StatefulWidget {
  // const TabEkrani({Key key}) : super(key: key);

  @override
  State<TabEkrani> createState() => _TabEkraniState();
}

class _TabEkraniState extends State<TabEkrani> {
  // Note: change the tab screen titles so remove the code below :

  // final List<Widget> _ekranlar = [
  //   //  defining indexes of the pages
  //   //  this is a instantiated list of  widgets
  //   EkranKategorisi(),
  //   FavoriEkrani(),
  // ];

  final List<Map<String, Object>> _ekranlar = [
    {
      'sayfa': EkranKategorisi(),
      'baslik': 'Kategoriler',
    },
    {
      'sayfa': FavoriEkrani(),
      'baslik': 'Favoriler',
    },
  ];

  int _seciliEkranIndeksi = 0; // default olarak secili ekran indexi 0
  // yani burada EkranKategorisi == 0

  void _seciliEkran(int index) {
    // new method that is tapable
    //based on index of the page indexes are defined above (_ekranlar) (8)
    setState(() {
      _seciliEkranIndeksi =
          index; // yukaridaki indeks setState olarak tanimlanmistir
      // boylece herbir index seciminde ekran guncellenecektir. Bu yuzden stateful widget
      //a ihtiyac duyulmustur.
    });
  }

  @override
  Widget build(BuildContext context) {
    //NOTE: For the tab adding on the bottom screen we need stateful widget and
    // for this purpose we basically delete DefaultTabController from the code

    // return DefaultTabController(
    //   // we need screen so scaffold widget and create a tab
    //   length: 2, // two tabs we need
    //   //initialIndex: 0, // means that show s kategoriler tab first
    //   child:

    //NOTE: For the tab adding on the bottom screen we need stateful widget and
    // for this purpose we basically delete DefaultTabController from the code

    return Scaffold(
      //NOTE: We dont need Appbar for the bottom tab widget

      // for the screen
      appBar: AppBar(
        title: Text(
            _ekranlar[_seciliEkranIndeksi]['baslik']), // modify for  map object
      ),

      drawer: MainDrawer(),

      // now call (render) the main drawer
      // Drawer( // create a drawer argument in the scaffold widget
      //   child: Text('The drawer!'),
      // ),

      //   bottom: TabBar(tabs: [
      //     // define tabs
      //     Tab(
      //       // first tab
      //       icon: Icon(Icons.category),
      //       text: 'Kategoriler',
      //     ),
      //     Tab(
      //       // second tab
      //       icon: Icon(Icons.star),
      //       text: 'Favoriler',
      //     ),
      //   ]),
      // ),
      //NOTE: We dont need Appbar for the bottom tab widget

      body: _ekranlar[_seciliEkranIndeksi]['sayfa'], // modify for a map object
      // list of widgets are ekran kategorisi and
      //favori ekrani. body ' deki gorunum ekranlarin indeksine gore guncellensin

      //NOTE: We dont need tabbar view for the bottom tab widget

      // TabBarView(children: [
      //   // tabbar goruntusu
      //   EkranKategorisi(), // both widget should be instantiated first tab activates this screen (6)
      //   FavoriEkrani(), // both widget should be instantiated second tabs activates this screen (6)
      // ]),
      //NOTE: We dont need tabbar view for the bottom tab widget

      bottomNavigationBar: BottomNavigationBar(
        // bottom navigation tab should be like this (8)
        onTap: _seciliEkran, // thats a difference from tapbar from the appbar
        // onTap needs execute a method which we ll define above
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amberAccent,
        currentIndex:
            _seciliEkranIndeksi, // it means that now the screen knows which tabs
        // is seelcted and tabs colors change by selecting them (9)
        //type: BottomNavigationBarType.shifting, // is a animation little bit
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context)
                .primaryColor, // arrange background of the tabs
            icon: Icon(Icons.category),
            label: 'Kategoriler',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context)
                .primaryColor, // arrange background of the tabs
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
    //);
  }
}
