import 'package:flutter/material.dart';

class KategoriOgeleri extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  KategoriOgeleri(
    this.id,
    this.title,
    this.color,
  );

  void kategoriSec(BuildContext icerik) {
    Navigator.of(icerik).pushNamed('/yemek-kategorileri', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => kategoriSec(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
