import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/normal_widgets/yemek_ogeleri.dart';
import '../models/yemek.dart';

class YemekKategorileriEkrani extends StatefulWidget {
  static const routeName = '/yemek-kategorileri';

  final List<Yemek> uygunYemekler;

  YemekKategorileriEkrani(this.uygunYemekler);

  @override
  State<YemekKategorileriEkrani> createState() =>
      _YemekKategorileriEkraniState();
}

class _YemekKategorileriEkraniState extends State<YemekKategorileriEkrani> {
  String kategoryBaslik;
  List<Yemek> yemekGoster;
  var _initialDataYukleniyor = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_initialDataYukleniyor) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      kategoryBaslik = routeArgs['title'];
      final kategoryId = routeArgs['id'];

      yemekGoster = widget.uygunYemekler.where((Yemek) {
        return Yemek.categories.contains(kategoryId);
      }).toList();
      _initialDataYukleniyor = true;
    }

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    kategoryBaslik = routeArgs['title'];
    final kategoryId = routeArgs['id'];

    yemekGoster = widget.uygunYemekler.where((Yemek) {
      return Yemek.categories.contains(kategoryId);
    }).toList();
    _initialDataYukleniyor = true;

    super.didChangeDependencies();
  }

  void _yemekSil(String yemekId) {
    setState(() {
      yemekGoster.removeWhere((yemek) => yemek.id == yemekId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kategoryBaslik),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return YemekOgeleri(
            id: yemekGoster[index].id,
            title: yemekGoster[index].title,
            imageUrl: yemekGoster[index].imageUrl,
            duration: yemekGoster[index].duration,
            affordability: yemekGoster[index].affordability,
            complexity: yemekGoster[index].complexity,
            removeItem: _yemekSil,
          );
        },
        itemCount: yemekGoster.length,
      ),
    );
  }
}
