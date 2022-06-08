import 'package:api_ass/provider/apiicon.dart';
import 'package:api_ass/provider/apivalue.dart';
import 'package:api_ass/provider/dropvalue.dart';
import 'package:api_ass/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  static String id = 'LoadingScreen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void setapi() async {
    var currencie = Provider
        .of<dropvalue>(context, listen: false)
        .dropdownValue;
    var BTCcoin = 'BTC' ;
    var LTCcoin = 'LTC' ;
    var ETHcoin = 'ETH' ;
    var url = [
      Uri.https('rest.coinapi.io', 'v1/exchangerate/$BTCcoin/$currencie', {'apikey': '5D3DBB81-7AB2-45E1-90D3-D435EEA1E6C9'}),
      Uri.https('rest.coinapi.io', 'v1/exchangerate/$LTCcoin/$currencie', {'apikey': '5D3DBB81-7AB2-45E1-90D3-D435EEA1E6C9'}),
      Uri.https('rest.coinapi.io', 'v1/exchangerate/$ETHcoin/$currencie', {'apikey': '5D3DBB81-7AB2-45E1-90D3-D435EEA1E6C9'}),
    ];
    final response = [];
    final jsonResponse = [];
    final itemCount = [];

    for (var i = 0; i < url.length; i++) {
      response.add(await http.get(url[i]));
      jsonResponse.add(convert.jsonDecode(response[i].body));
      jsonResponse[i]['rate'] == null ? itemCount.add(100) :itemCount.add(double.parse(jsonResponse[i]['rate'].toStringAsFixed(2)));

    }
    Provider.of<apivalue>(context, listen: false).chageApiValue(itemCount);

    var urlIcon = Uri.https('rest.coinapi.io', 'v1/assets/icons/10', {'apikey': '5D3DBB81-7AB2-45E1-90D3-D435EEA1E6C9'});
    var responseIcon = await http.get(urlIcon);
    var jsonResponseIcon = convert.jsonDecode(responseIcon.body) ;
    var icon = [];
    icon.add(jsonResponseIcon.where((i) => i['asset_id'] == 'BTC' || i['asset_id'] == 'LTC' || i['asset_id'] == 'ETH').toList());
    Provider.of<apiicon>(context, listen: false).chageApiIcon(icon);
    Navigator.pushNamed(context, HomeScreen.id);
  }

  @override
  void initState(){
    super.initState();
    setapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Container(
      child:
        SpinKitWave(
          color: Colors.black,
          size: 50.0,

        ),
    )
    );
  }
}
