import 'package:api_ass/provider/apiicon.dart';
import 'package:api_ass/provider/apivalue.dart';
import 'package:api_ass/screen/home_screen.dart';
import 'package:api_ass/screen/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:provider/provider.dart';
import 'provider/dropvalue.dart';
import 'dart:async';

void main() {
  runApp(MyApp());

}
//648CA7E2-D045-4D3C-960D-075CCEEBB025
//8A0FBF4C-E5EC-45AC-A091-50D3C5887881
//29BD7C83-155F-4AAD-AF9D-FA0C0B95A533
//5D3DBB81-7AB2-45E1-90D3-D435EEA1E6C9
//E394C70F-5159-4BF5-90FA-F42B76CD386A

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiProvider(
        providers: [
        ChangeNotifierProvider<dropvalue>(create: (context) => dropvalue()),
          ChangeNotifierProvider<apivalue>(create: (context) => apivalue()),
          ChangeNotifierProvider<apiicon>(create: (context) => apiicon()),
    ],
    child:  MaterialApp(

        initialRoute: LoadingScreen.id,
        routes:
        {
          LoadingScreen.id:(context)=>LoadingScreen(),
          HomeScreen.id:(context)=>HomeScreen(),


        },

      )
    );

  }

}




//
// void getWeather() async{
//   String coin = 'BTC';
//   String currencie = 'USD';
//   var url =
//   Uri.https('rest.coinapi.io', 'v1/exchangerate/$coin/$currencie', {'apikey': '8A0FBF4C-E5EC-45AC-A091-50D3C5887881'});
//   var response = await http.get(url);
//   var jsonResponse =
//   convert.jsonDecode(response.body) ;
//   var itemCount = jsonResponse['rate'];
//   if (response.statusCode == 200) {
//
//     print(itemCount);
//   } else {
//     print('Request failed with status: ');
//   }
//
// }