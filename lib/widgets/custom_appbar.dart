import 'package:api_ass/provider/apiicon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(

          mainAxisAlignment:MainAxisAlignment.center ,
          children:  [
            Image.network(Provider.of<apiicon>(context, listen: false).apiIcon[0][0]['url'].toString(), width: 45),
            SizedBox(

              width: 8,
            ),
            Text(
              'COIN RATE',
              style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),

            )],
        ),
      ),
    );
  }
}
