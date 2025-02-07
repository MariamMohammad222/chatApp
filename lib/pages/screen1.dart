import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/registerpage.dart';
import 'package:flutter_application_1/widgets/textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
                   onTap: () async {
  if (keyform.currentState!.validate()) {
    setState(() {
      isloading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
         Navigator.pushNamed(context,'chattApp');
      // إذا نجح تسجيل الدخول، إظهار رسالة نجاح
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong password')),
        );
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user found for that email.')),
        );
      } 
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred')),
      );
    } 
     
      setState(() {
        isloading = false;
      });
    
  }
},
              

                     child: Container(width: double.infinity,height: 60 ,
                     child: Center(
                       child: Text('login',
                       style: TextStyle( fontSize: 20),),
                     ) ,),
                   ),
                
                SizedBox(height: 40,),
                Row( children: [ 
              Text('yoy dont have an account?'),
              GestureDetector(child: Text('register')
              ,onTap:(){
                Navigator.push(context,MaterialPageRoute(builder:(context) {
                  return registerpage();
                },));
              },)
            ],)
               
              ],
            ),
        ),
      ),
    );
  }
}
