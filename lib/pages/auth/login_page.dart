import 'package:chatapp_firebase/shared/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor
      ),
      body:Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 28,bottom: 10),
              child: Text("Groupie",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
            ),
            Text("Login now to see what they are talking",
            style: TextStyle(fontSize: 16,
            fontWeight: FontWeight.normal,color: Colors.black54),),
            SizedBox(height: 40,),
            Image(image: AssetImage("assets/images/new.jpg",),
            fit: BoxFit.fitWidth,height:200,),
            
          ],
        )
       ), 
      );
  }
}