import 'package:api_ass/provider/apiicon.dart';
import 'package:api_ass/provider/apivalue.dart';
import 'package:api_ass/provider/dropvalue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({Key? key}) : super(key: key);

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}
//648CA7E2-D045-4D3C-960D-075CCEEBB025
//8A0FBF4C-E5EC-45AC-A091-50D3C5887881
//29BD7C83-155F-4AAD-AF9D-FA0C0B95A533
//5D3DBB81-7AB2-45E1-90D3-D435EEA1E6C9
//E394C70F-5159-4BF5-90FA-F42B76CD386A
class _CustomDropDownButtonState extends State<CustomDropDownButton> {

   void getWeather(String currencie) async{
    var BTCcoin = 'BTC' ;
    var LTCcoin = 'LTC' ;
    var ETHcoin = 'ETH' ;
    print(currencie);
    var url = [
      Uri.https('rest.coinapi.io', 'v1/exchangerate/$BTCcoin/$currencie', {'apikey': '5D3DBB81-7AB2-45E1-90D3-D435EEA1E6C9'}),
      Uri.https('rest.coinapi.io', 'v1/exchangerate/$LTCcoin/$currencie', {'apikey': '5D3DBB81-7AB2-45E1-90D3-D435EEA1E6C9'}),
      Uri.https('rest.coinapi.io', 'v1/exchangerate/$ETHcoin/$currencie', {'apikey': '5D3DBB81-7AB2-45E1-90D3-D435EEA1E6C9'}),
    ];

    final response = [];
    final jsonResponse = [];
    final itemCount = [];
    print(url);

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
  }


  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height /40;
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 80, vertical: 0),
      decoration: BoxDecoration(
        color: MainColor,

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [


          CustomText(text: "Choose Currency", color: Colors.white,),

          DropdownButton<String>(

            value:Provider
                .of<dropvalue>(context)
                .dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 28,
            elevation: 20,
            style: const TextStyle(
                color: Colors.white
            ),
            underline: Container(
              height: 0,
            ),

            onChanged: (String? newValue) {
              setState(() {
                Provider.of<dropvalue>(context, listen: false)
                    .chageDropDownValue(newValue!);
                getWeather(Provider
                    .of<dropvalue>(context, listen: false)
                    .dropdownValue);
              });
            },

            items: <String>['USD', 'EUR', 'GBP']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: CustomText(text: value,
                  alignment: Alignment.center,
                  color: Colors.white,),
              );
            }).toList(),
            dropdownColor: MainColor,
          ),
        ],
      ),
    );
  }

  }

