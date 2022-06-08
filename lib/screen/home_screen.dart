import 'package:api_ass/provider/apiicon.dart';
import 'package:api_ass/provider/apivalue.dart';
import 'package:api_ass/provider/dropvalue.dart';
import 'package:api_ass/widgets/custom_appbar.dart';
import 'package:api_ass/widgets/custom_dropdownbutton.dart';
import 'package:api_ass/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';



class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();


}


class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height / 4.7;



    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: CustomAppBar(),
          backgroundColor: MainColor,
        ),
      ),
      body:  Container(
        color: SecondaryColor,
        child: ListView(

          children: [

            Padding(

              padding:  EdgeInsets.symmetric(vertical: height,horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  CustomText(text: Provider.of<apivalue>(context).ApiValue[0].toString(), src_id: 0, alignment: Alignment.center, color: Colors.white,currencie: Provider.of<dropvalue>(context, listen: false).dropdownValue,frontsize: 20),
                  SizedBox(
                    height: height*.1,
                  ),
                  CustomText(text: Provider.of<apivalue>(context).ApiValue[1].toString(), src_id: 1, alignment: Alignment.center, color: Colors.white,currencie: Provider.of<dropvalue>(context, listen: false).dropdownValue,frontsize: 20),
                  SizedBox(
                    height: height*.1,
                  ),
                  CustomText(text: Provider.of<apivalue>(context).ApiValue[2].toString(), src_id: 2, alignment: Alignment.center, color: Colors.white,currencie: Provider.of<dropvalue>(context, listen: false).dropdownValue,frontsize: 20),

                ],
              ),
            ),
            CustomDropDownButton(),
          ],
        ),
      ),
    );
  }

}
