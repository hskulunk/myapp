// import 'package:flutter/material.dart';
// import '../screen_widgets/ayarlar_ekrani.dart';

// class MainDrawer extends StatelessWidget {
//   // const MainDrawer({Key key}) : super(key: key);

//   Widget buildListTile(String title, IconData icon, Function tapHandler) {
//     return ListTile(
//       leading: Icon(
//         icon, // eslestir, yukarda tanimli
//         size: 26,
//       ),
//       title: Text(
//         title, // eslestir, yukarda tanimli
//         style: TextStyle(
//           fontFamily: 'RobotoCondensed',
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       onTap:
//           tapHandler, // when on tap implemet the function (tapHandler function)
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           Container(
//             height: 120,
//             width: double.infinity,
//             padding: EdgeInsets.all(20),
//             alignment: Alignment.centerLeft,
//             color: Theme.of(context).canvasColor,
//             child: Text(
//               'Pisir!',
//               style: TextStyle(
//                   fontWeight: FontWeight.w900,
//                   fontSize: 30,
//                   color: Theme.of(context).primaryColor),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           buildListTile(
//               // this is a listtile defined as build widget above
//               'Yemekler',
//               Icons.restaurant, () {
//             Navigator.of(context).pushNamed('/'); // call the TabEkrani  as
//             //a function defined in buildListTile
//           }),
//           buildListTile(
//               // this is a listtile  defined as build widget above
//               'Ayarlar',
//               Icons.settings, () {
//             Navigator.of(context)
//                 .pushNamed(AyarlarEkrani.routeName); // call the
//             // AyarlarEkrani  as a function defined in buildListTile
//           }),
//         ],
//       ),
//     );
//   }
// }

//version 4

import 'package:flutter/material.dart';
import '../screen_widgets/ayarlar_ekrani.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).canvasColor,
            child: Text(
              'Pisir!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Yemekler', Icons.restaurant, () {
            Navigator.of(context).pushNamed('/');
          }),
          buildListTile('Ayarlar', Icons.settings, () {
            Navigator.of(context).pushNamed(AyarlarEkrani.routeName);
          }),
        ],
      ),
    );
  }
}
