
import 'package:alimentation/src/Models/Aliments.dart';
import 'package:alimentation/src/Providers/AlimetsProvider.dart';
import 'package:alimentation/src/Sockets/sockets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlimentationPage extends StatelessWidget {
  const AlimentationPage({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    CustomSockets.activate(context);
    final size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body:ChangeNotifierProvider(
          create: (_) => AlimentsProvider(),
          child:Container(
            width: size.width*0.9,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 0.5,
              children: cards(CustomSockets.getAlimentsProvider().getAliments(),size),
            ),
          )
        ),
      );
  }
  List<Widget> cards(List<Alimentation> aliments,Size size) {
    print('Realizando cards');
    List<Widget> cards = [];
    for (var aliment in aliments) {
      cards.add(
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInImage(
              width: size.width*0.3,
              height: size.height*0.15,
              placeholder:  NetworkImage("https://upload.wikimedia.org/wikipedia/commons/b/b1/Loading_icon.gif?20151024034921"), 
              image: NetworkImage(aliment.productos[0]['imageUrl']??'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png')
            ),
            Text(aliment.name),
            // TextButton(onPressed: (){

            // }, child: Text('Button'))
          ],
        ),
        )
      );
    }
    return cards;
  }
}