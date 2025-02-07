import 'package:flutter/material.dart';

class customfield extends StatelessWidget {
   customfield({super.key, 
    this.hintText,
    this.onChanged
  });
  String ?hintText; 
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField( 
      validator: (value){
        if(value!.isEmpty){
          return 'please fill this field';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration( 
        hintText: hintText,
        enabledBorder:  OutlineInputBorder( 
          borderSide: BorderSide( 
            color: Colors.white
          )
        ) ,
        border: OutlineInputBorder( 
          borderSide: BorderSide( 
            color: Colors.white
          )
        )
      ),
    );
  }
}