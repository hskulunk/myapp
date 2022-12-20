import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  // const MainDrawer({Key key}) : super(key: key);

  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon, // eslestir, yukarda tanimli
        size: 26,
      ),
      title: Text(
        title, // eslestir, yukarda tanimli
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        //...        go to the different page
      },
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
          buildListTile(
            // this is a listtile defined as build widget above
            'Yemekler',
            Icons.restaurant,
          ),
          buildListTile(
            // this is a listtile  defined as build widget above
            'Ayarlar',
            Icons.settings,
          ),
        ],
      ),
    );
  }
}
