


import 'package:flutter/cupertino.dart';

class apivalue extends ChangeNotifier
{
  List  ApiValue = [];
  int total = 0;

  chageApiValue(var value)
  {

    ApiValue = value;
    total += 1;
    notifyListeners();
  }
}