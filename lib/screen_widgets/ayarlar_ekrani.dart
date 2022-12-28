import 'package:flutter/material.dart';
import '../normal_widgets/main_drawer.dart';

class AyarlarEkrani extends StatefulWidget {
  static const routeName = '/ayarlar';

  final Function filtreKaydet;
  final Map<String, bool> mevcutFiltreler;

  AyarlarEkrani(this.mevcutFiltreler, this.filtreKaydet);

  @override
  State<AyarlarEkrani> createState() => _AyarlarEkraniState();
}

class _AyarlarEkraniState extends State<AyarlarEkrani> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.mevcutFiltreler['gluten'];
    _lactoseFree = widget.mevcutFiltreler['lactose'];
    _vegan = widget.mevcutFiltreler['vegan'];
    _vegeterian = widget.mevcutFiltreler['vegeterian'];
    super.initState();
  }

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
          IconButton(
              onPressed: () {
                final secilenFiltreler = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };
                widget.filtreKaydet(secilenFiltreler);
              },
              icon: Icon(Icons.save))
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
