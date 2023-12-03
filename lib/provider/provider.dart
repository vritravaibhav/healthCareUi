import 'package:alemenoproject/widgets/itemcard.dart';
import 'package:flutter/material.dart';

class VarProvider with ChangeNotifier {
  DateTime? val=DateTime.now();
  int? time=8;
   int mrpTotal = 0;
  int price = 0;
 List<ItemCard>? card = [];
  void statechanged() {
    notifyListeners();
  }
}
