import 'package:flutter/material.dart';
import '../normal_widgets/main_drawer.dart';

class AyarlarEkrani extends StatefulWidget {
  // which filters set or not we dont know
// change the stateless widget into statefull widget (1)
  static const routeName = '/ayarlar';

  @override
  State<AyarlarEkrani> createState() => _AyarlarEkraniState();
}

class _AyarlarEkraniState extends State<AyarlarEkrani> {
  // add new propetries in the AyarlarEkrani widget (2)
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(
    // create a build method (6)
    // add a widget properties
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      // pass the properties based on above (7)
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlarim'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Yemek secimini ayarla',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                'Gluuten-free',
                'Sadece gluteen-free yemekleri icerir',
                _glutenFree,
                (newValue) {
                  // this is an updated value (8)
                  setState(() {
                    _glutenFree = newValue; // defined just above
                  });
                },
              ),

              // Do it for other var properties which are defined above (9)
              _buildSwitchListTile(
                'Lactose-free',
                'Sadece lactose-free yemekleri icerir',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegeterian',
                'Sadece vejeretyan yemekleri icerir',
                _vegeterian,
                (newValue) {
                  setState(() {
                    _vegeterian = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Sadece vegan yemekleri icerir',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
