import 'package:flutter/material.dart';
import '../databases/dummy_data.dart';

class YemekDetayiEkrani extends StatelessWidget {
  static const routeName = '/yemek-detayi';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final yemekId = ModalRoute.of(context).settings.arguments as String;
    final secilenYemek = DUMMY_MEALS.firstWhere((yemek) => yemek.id == yemekId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${secilenYemek.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                secilenYemek.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(
              context,
              'Ingredients',
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      secilenYemek.ingredients[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                itemCount: secilenYemek.ingredients.length,
              ),
            ),
            buildSectionTitle(
              context,
              'Steps',
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        secilenYemek.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: secilenYemek.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.of(context).pop(yemekId);
        },
      ),
    );
  }
}
