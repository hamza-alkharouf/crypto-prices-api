


import 'package:flutter/cupertino.dart';

class apiicon extends ChangeNotifier
{
  List<dynamic>  apiIcon = [];
  chageApiIcon(List<dynamic> value)
  {
    apiIcon = value;

    notifyListeners();
  }
}