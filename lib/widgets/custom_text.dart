import 'dart:ui';

import 'package:api_ass/provider/apiicon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class CustomText extends StatefulWidget {
  final String text;
  final String currencie;
  final double frontsize;
  final Color color;
  final Alignment alignment;
  final src_id;

  CustomText({required this.text, this.src_id ,this.frontsize =16 ,this.color = Colors.black ,this.alignment = Alignment.center, this.currencie=" "});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: MainColor,
      padding: const EdgeInsets.all(12),
      child:Row(

        children: [
          widget.src_id == null ?Text('.',style:TextStyle(color: MainColor)) : Image.network(Provider.of<apiicon>(context, listen: false).apiIcon[0][widget.src_id]['url'].toString(), width: 50,),
          SizedBox(

            width: width *0.1,
          ),
          Text(widget.text,
            style: TextStyle(
                color: widget.color,
                fontSize: widget.frontsize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 3),
          Text(widget.currencie ,
            style: TextStyle(
              color: widget.color,
              fontSize: widget.frontsize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

    );
  }
}
