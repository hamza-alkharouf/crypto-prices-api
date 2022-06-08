


import 'package:flutter/cupertino.dart';

class dropvalue extends ChangeNotifier
{
  String dropdownValue = 'USD';

  chageDropDownValue(String value)
  {
    dropdownValue = value;
    notifyListeners();
  }
}