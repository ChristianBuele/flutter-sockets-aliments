import 'dart:convert';

import 'package:alimentation/src/Models/Aliments.dart';
import 'package:flutter/cupertino.dart';

class AlimentsProvider extends ChangeNotifier {
  List<Alimentation> _aliments = [];

  set aliments(Alimentation aliment){
    print('Existen cambios en el alimento:'+_aliments.length.toString());
    _aliments.add(aliment);
    print('Insertando alimento');
    print(_aliments);
    notifyListeners();
  }
  //get aliments
  List<Alimentation> getAliments() {
    return [..._aliments];
  }
}