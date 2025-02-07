import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class registerpage extends StatefulWidget {
   registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  String ?password;
  String ?email;
  bool isloading=false;  
  GlobalKey<FormState> keyform=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold( 
         backgroundColor: Colors.blue,
        body:  Form(
          key: keyform,
          child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Text("scholar chat",style: TextStyle( 
                  fontSize: 18,
                )),
                 Text("register",style: TextStyle( 
                  fontSize: 18,
                )),
                customfield(
                  hintText: 'email',
                  onChanged: (data) {
                      email=data;
                  },
                ),
                  customfield(
                  hintText: 'password',
                  onChanged: (data) {
                     password=data;
                  },
                ),
                   GestureDetector(
                    onTap: () async{
                      
                      if(keyform.currentState!.validate())
                          isloading=true;
                          setState(() {
                            
                          });
                        try{
                          UserCredential user= 
                          await FirebaseAuth.instance.createUserWithEmailAndPassword
                          (email: email!, password: password!); 
                          Navigator.pushNamed(context,'chattApp');
          
                        }
                        on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              ScaffoldMessenger.of(context).showSnackBar
              (SnackBar(content:Text('weak password')));
            } else if (e.code == 'email-already-in-use') {
              ScaffoldMessenger.of(context).showSnackBar
              (SnackBar(content:Text('email-already-in-use')));
            }
              } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar
              (SnackBar(content:Text('there was an error')));
               }
               isloading=true;
               setState(() {
                 
               });
              ScaffoldMessenger.of(context).showSnackBar
              (SnackBar(content:Text('success')));},
              

                     child: Container(width: double.infinity,height: 60 ,
                     child: Center(
                       child: Text('register',
                       style: TextStyle( fontSize: 20),),
                     ) ,),
                   ),
                
                SizedBox(height: 40,),
               
              ],
            ),
        ),
      ),
    );
  }
}



//  عملية الفاليديشن بتتاكد من انك دخلت القيم او تتاكد من انك دخلت القيم بشكل صحيح او ان الباسورد مش ضعيفة مثلا 