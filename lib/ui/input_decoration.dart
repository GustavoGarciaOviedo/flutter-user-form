import 'package:flutter/material.dart';
 
class InputDecorations {
  
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }){
    return  InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color:Colors.grey,
                    
                  )
                 ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                    width: 2
                  )
                ),
                hintText: hintText,
                labelText: labelText ,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon!= null 
                ? Icon(prefixIcon, color: Colors.pinkAccent, size: 25,)
                :null,
                

              );
  }
  
}