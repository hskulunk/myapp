import 'package:flutter/material.dart';
import '../normal_widgets/main_drawer.dart';
import '../screen_widgets/favori_ekrani.dart';
import '../screen_widgets/ekran_kategorisi.dart';

class TabEkrani extends StatefulWidget {
  @override
  State<TabEkrani> createState() => _TabEkraniState();
}

class _TabEkraniState extends State<TabEkrani> {
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

  int _seciliEkranIndeksi = 0;

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
