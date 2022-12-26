import 'package:flutter/material.dart';
import '../normal_widgets/main_drawer.dart';

class AyarlarEkrani extends StatelessWidget {
  static const routeName = '/ayarlar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlarim'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
          'Ayarlar!',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
