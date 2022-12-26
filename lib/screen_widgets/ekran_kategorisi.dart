import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/normal_widgets/kategori_ogeleri.dart';
import '../databases/dummy_data.dart';

class EkranKategorisi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (katData) => KategoriOgeleri(
              katData.id,
              katData.title,
              katData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
