import 'package:alimentation/src/Pages/AlimentationPage.dart';
import 'package:alimentation/src/Providers/AlimetsProvider.dart';
import 'package:alimentation/src/Sockets/sockets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CustomSockets.init();
   runApp(
    
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AlimentsProvider(), 
        )
      ],
      child: MyApp() ,
    )
    );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'alimentation',
      routes: {
        'alimentation': (context) => AlimentationPage(),
      },
    );
  }

  
 
}