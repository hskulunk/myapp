import 'package:flutter/material.dart';

class AyarlarEkrani extends StatelessWidget {
  //const AyarlarEkrani({Key key}) : //super(key: key);
  static const routeName =
      '/ayarlar'; // define routes, now we need to connect with
  //main.dart file

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ayarlar!'),
    );
  }
}