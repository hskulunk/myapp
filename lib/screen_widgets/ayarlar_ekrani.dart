import 'package:flutter/material.dart';
import '../normal_widgets/main_drawer.dart';

class AyarlarEkrani extends StatefulWidget {
  static const routeName = '/ayarlar';

  final Function filtreKaydet; // now create a new function (filtreKaydet) (5)
  final Map<String, bool>
      mevcutFiltreler; // now create a mevcutFilteler that has
  // the same property of _filtreler in the main.dart (19)

  AyarlarEkrani(this.mevcutFiltreler, this.filtreKaydet); //(19)

  @override
  State<AyarlarEkrani> createState() => _AyarlarEkraniState();
}

class _AyarlarEkraniState extends State<AyarlarEkrani> {
  var _glutenFree = false; // referring (17)
  var _vegeterian = false; // referring (17)
  var _vegan = false; // referring (17)
  var _lactoseFree = false; // referring (17)

  // now we dont need to set all filters as false instead of it use initState (20)

  @override
  void initState() {
    // (20)
    _glutenFree = widget.mevcutFiltreler['gluten']; // (20)
    _lactoseFree = widget.mevcutFiltreler['lactose']; // (20)
    _vegan = widget.mevcutFiltreler['vegan']; // (20)
    _vegeterian = widget.mevcutFiltreler['vegeterian']; // (20)
    super.initState(); // (20)
  }

//  Note: when I click to go back i dont see the filters that i set before. We dont need
// always initialize the false values as above (17)

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
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
        actions: [
          // create an actions button in the appbar of AyarlarEkrani
          IconButton(
              onPressed: () {
                // when on pressed point the defined function (filtreKaydet) above (6)
                final secilenFiltreler = {
                  // create a final list of properties (15)
                  'gluten': _glutenFree, // properties are define above (15)
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };
                widget.filtreKaydet(
                    secilenFiltreler); // when click to save button
                // filters should be activated (16)
              },
              icon: Icon(Icons.save)) //
        ],
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
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
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
