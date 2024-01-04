import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
   MyButton({
     super.key,
     required this.text,
     required this.onPressed,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0,bottom: 5,left: 5,right: 5),
      child: MaterialButton(onPressed: onPressed,
      color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Adjust the value for rounded edges
        ),
        minWidth: 100, // Adjust the value for the desired width
        height: 40,

        child:Text(text,style: TextStyle(fontSize: 16))
        ),
    );
  }
}
