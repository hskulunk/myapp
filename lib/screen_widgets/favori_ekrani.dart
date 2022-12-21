// note: favori ekrani is a stateless widget

//version 4
import 'package:flutter/material.dart';

class FavoriEkrani extends StatelessWidget {
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
