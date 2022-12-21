// import 'package:flutter/material.dart';

// class AyarlarEkrani extends StatelessWidget {
//   //const AyarlarEkrani({Key key}) : //super(key: key);
//   static const routeName =
//       '/ayarlar'; // define routes, now we need to connect with
//   //main.dart file

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Ayarlar!'),
//     );
//   }
// }

//version 4
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
      drawer: MainDrawer(), // add  a drawer
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
