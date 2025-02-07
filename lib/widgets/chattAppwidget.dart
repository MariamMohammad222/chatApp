import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/message.dart';

class chatApp extends StatelessWidget {
   chatApp({super.key,required this.messageee});
   final Message  messageee;
  
  @override
  Widget build(BuildContext context) {
    return 
          
          Padding(
            padding: const EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container( 
               
                
                padding: EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 16),
                decoration: BoxDecoration(borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32)
                )
                ,border: Border.all(color: Colors.black)),
              
                child: Text(messageee.message),
              ),
            )
          );
          
  }
}