// note: favori ekrani is a stateless widget

import 'package:flutter/material.dart';

class FavoriEkrani extends StatelessWidget {
  // const FavoriEkrani({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favoriler',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
