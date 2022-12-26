// import 'package:flutter/material.dart';

// class YemekDetayiEkrani extends StatelessWidget {
//   //const YemekDetayiEkrani({Key key}) : super(key: key);
//   static const routeName =
//       '/yemek-detayi'; // we create a routeName as we created on
//   //yemek_kategorileri_ekrani for being a consistent
//   // now we need to register to the main dart (onemli-2)

//   @override
//   Widget build(BuildContext context) {
//     final yemekId = ModalRoute.of(context).settings.arguments as String; //
//     // finally add a constructor (yemekId) to connect the defined routeName argument
//     // note: argument defined in yemek_ogeleri (onemli-6)
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$yemekId'),
//       ),
//       body: Center(
//         child: Text('Yemekler - $yemekId!',
//             style: TextStyle(
//               fontSize: 17,
//               color: Colors.black,
//             )),
//       ),
//     );
//   }
// }

// // note: YemekDetayiEkrani should be appered when we tap on the yemek_ogeleri (onemli-0)

// import 'package:flutter/material.dart';
// import '../databases/dummy_data.dart'; // import dummy data

// class YemekDetayiEkrani extends StatelessWidget {
//   static const routeName = '/yemek-detayi';

//   Widget buildSectionTitle(BuildContext context, String text) {
//     // cok onemli (2)
//     // burada widget olusturuyoruz. birkac kere kullanmak icin
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Text(
//         text,
//         style: Theme.of(context).textTheme.titleMedium,
//       ),
//     );
//   }

//   Widget buildContainer(Widget child) {
//     // cok onemli (3)
//     // burada widget olusturuyoruz. birkac kere kullanmak icin
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.all(10),
//       height: 150,
//       width: 300,
//       child: child,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final yemekId = ModalRoute.of(context).settings.arguments as String;
//     final secilenYemek = DUMMY_MEALS.firstWhere(
//         (yemek) => yemek.id == yemekId); // this is a crucial code  (1)
//     //firstwhere means get only one yemek when the condition is satisfied
//     // yemekId defined  above
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('${secilenYemek.title}'), // modify
//         ),
//         body: SingleChildScrollView(
//           // we dont have enough space
//           // so we wrap the column widget with the single child scroll view wigdet (4)
//           child: Column(
//             children: [
//               Container(
//                 height: 300,
//                 width: double.infinity,
//                 child: Image.network(
//                   secilenYemek.imageUrl, // we need to acces
//                   // dummy datas images
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               buildSectionTitle(
//                 // widget a gore modifiye edildi
//                 context,
//                 'Ingredients',
//               ),
//               // ListView(), // listview shows infinity so we should go for container
//               buildContainer(
//                 // yukarda tanimladigin widget i buraya yaz (3)
//                 ListView.builder(
//                   // we can create list view here
//                   itemBuilder: (context, index) => Card(
//                     color: Theme.of(context).colorScheme.secondary,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 5,
//                         horizontal: 10,
//                       ),
//                       child: Text(
//                         secilenYemek.ingredients[index], //define above
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   itemCount: secilenYemek.ingredients.length, //define above
//                 ),
//               ),

//               buildSectionTitle(
//                 // widget a gore modifiye edildi
//                 context,
//                 'Steps',
//               ),
//               buildContainer(
//                 ListView.builder(
//                   itemBuilder: (context, index) => Column(
//                     children: [
//                       ListTile(
//                         // we also need a divider (5) it can be made like this
//                         leading: CircleAvatar(
//                           child: Text('# ${(index + 1)}'),
//                         ),
//                         title: Text(
//                           secilenYemek.steps[index], // defined above
//                         ),
//                       ),
//                       Divider(), // draw horizontal line
//                     ],
//                   ),
//                   itemCount: secilenYemek.steps.length, //defined above
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

//version 4
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
      // Note: In this section, in the yemek_detayi_ekrani
      // we want a button that deletes the screen TEMPORARILY when we go back
      // to the yemek_kategorileri_ekrani
      //temporarily
      floatingActionButton: FloatingActionButton(
        // the button makes delete the details
        //of meal and go back
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.of(context)
              .pop(yemekId); // navigator of pop we can go back (1)
          // pop removes the screen of a top of stack, passing data is yemekId
        },
      ),
    );
  }
}
