import 'package:flutter/material.dart';
import 'panier_info.dart';

class Panier extends StatefulWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  //var
  final List<Pan> paniers = const [
    const Pan("assets/images/dmc5.jpg", 200),
    const Pan("assets/images/re8.jpg", 200),
    const Pan("assets/images/nfs.jpg", 100)
  ];

  //init
  @override
  void initState() {
    super.initState();
    //TO DO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("G-Store ESPRIT"),
        ),
        body: ListView.builder(
          itemCount: paniers.length,
          itemBuilder: (context, index) {
            return PanierInfo(paniers[index].image, paniers[index].price);
          },
        ));
  }
}

//ENTITY
class Pan {
  final String image;
  final int price;

  const Pan(this.image, this.price);
}
