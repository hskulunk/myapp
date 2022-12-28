import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/yemek.dart';
import '../normal_widgets/yemek_ogeleri.dart';

class FavoriEkrani extends StatelessWidget {
  final List<Yemek>
      favoriYemekler; //create a favoriYemekler (isim farkli olabilir) (5)

  FavoriEkrani(this.favoriYemekler); // (5)

  @override
  Widget build(BuildContext context) {
    if (favoriYemekler.isEmpty) {
      // (15) create an if statement for favori yemekler
      return Center(
        child: Text(
          'Henuz favori yemeginiz yok. Ekleyebilirsiniz.',
          style: TextStyle(color: Colors.black),
        ),
      );
    } else {
      return ListView.builder(
        // if we have favori yemekler add them into the body
        // of FavoriEkrani (16)
        itemBuilder: (ctx, index) {
          //(16)
          return YemekOgeleri(
            //(16)
            id: favoriYemekler[index].id, //(16)
            title: favoriYemekler[index].title, //(16)
            imageUrl: favoriYemekler[index].imageUrl, //(16)
            duration: favoriYemekler[index].duration, //(16)
            affordability: favoriYemekler[index].affordability, //(16)
            complexity: favoriYemekler[index].complexity, //(16)
            //  removeItem: _yemekSil, //(16) no need to remove anything
          );
        },
        itemCount: favoriYemekler.length, //(16)
      );
    }
  }
}
