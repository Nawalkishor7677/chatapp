import 'package:chatapp_firebase/pages/auth/register_page.dart';
import 'package:chatapp_firebase/shared/constants.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey=GlobalKey<FormState>();
  String Email="";
  String Password="";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor
      // ),
      body:SingleChildScrollView(
        child: Form(
          key: formkey,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 237, 105, 29),width: 2)
                    ),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 237, 105, 29),width: 2)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 237, 105, 29),width: 2)),
                 labelText: "Email",
                 prefixIcon: Icon(Icons.email,color: Color.fromARGB(255, 237, 105, 29),),
                  ),
                  onChanged: (value) {
               setState(() {
                 Email=value;
               });
                  },
                 validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Please enter a valid email";
                  }
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 237, 105, 29),width: 2)
                    ),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 237, 105, 29),width: 2)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 237, 105, 29),width: 2)),
                 labelText: "Password",
                 prefixIcon: Icon(Icons.lock,color: Color.fromARGB(255, 237, 105, 29),),
                  ),
                  validator: (value) {
                    if(value!.length <6){
                      return "Password must be at least 6 characters";
                    }
                    else {
                      return null;
                    }
                  },
                   onChanged: (value) {
                    setState(() {
                      Password=value;
                    });
                  },
                ),
              ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 237, 105, 29),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                  ),
                  onPressed: (){
                    login();
                  },
                   child: Text("Sign in")),
               ),
             ),
             Text.rich(TextSpan(text:"Don't have an accont?",
             style: TextStyle(
              color: Colors.black,fontSize: 14),
              children:[
                TextSpan(
                  text: "Register here",style: TextStyle(
                    color: Colors.black,decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                  ..onTap=() {
                    nextScreen(context, RegisterPage());
                  }
                )
              ])
              
              )
            ],
          ),
        )
       ), 
      );
  }
  login (){
    if (formkey.currentState!.validate()) {}
  }
}