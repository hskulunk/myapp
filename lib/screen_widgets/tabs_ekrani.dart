import 'package:flutter/material.dart';
import '../models/yemek.dart'; // import
import '../normal_widgets/main_drawer.dart';
import '../screen_widgets/favori_ekrani.dart';
import '../screen_widgets/ekran_kategorisi.dart';

class TabEkrani extends StatefulWidget {
  final List<Yemek>
      favoriYemekler; // create a list of favoriYemekler on TabEkrani (3)

  TabEkrani(this.favoriYemekler); //(3)

  @override
  State<TabEkrani> createState() => _TabEkraniState();
}

class _TabEkraniState extends State<TabEkrani> {
  List<Map<String, Object>>
      _ekranlar; // forward the list into the FavoriEkrani (4)
  // note: you cannot use widget with the initialized properties we should use inistate method (6)
  // note2: _ekranlar list is not a final it varies so delete the final
  int _seciliEkranIndeksi = 0;

  @override
  void initState() {
    _ekranlar = [
      {
        'sayfa': EkranKategorisi(),
        'baslik': 'Kategoriler',
      },
      {
        'sayfa': FavoriEkrani(widget.favoriYemekler),
        'baslik': 'Favoriler',
      },
    ];
    super.initState();
  }

  void _seciliEkran(int index) {
    setState(() {
      _seciliEkranIndeksi = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_ekranlar[_seciliEkranIndeksi]['baslik']),
      ),
      drawer: MainDrawer(),
      body: _ekranlar[_seciliEkranIndeksi]['sayfa'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _seciliEkran,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amberAccent,
        currentIndex: _seciliEkranIndeksi,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Kategoriler',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
