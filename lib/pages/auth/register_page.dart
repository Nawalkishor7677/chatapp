import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/pages/auth/login_page.dart';
import 'package:chatapp_firebase/pages/home_page.dart';
import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor))
          : SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 28,bottom: 10),
                child: Text("Groupie",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              ),
              Text("Create your account now to cchat and explore",
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
                 labelText: "Full Name",
                 prefixIcon: Icon(Icons.person,color: Color.fromARGB(255, 237, 105, 29),),
                  ),
                  onChanged: (value) {
               setState(() {
                 fullName=value;
               });
                  },
                validator: (value) {
                  if(value!.isNotEmpty){
                    return null;
                  }
                  else {
                    return "Name cannot be empty";
                  }
                },
                ),
              ),
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
                   email=value;
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
                      password=value;
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
                    register();
                  },
                   child: Text("Register")),
               ),
             ),
             Text.rich(TextSpan(text:"Alredy have a account?",
             style: TextStyle(
              color: Colors.black,fontSize: 14),
              children:[
                TextSpan(
                  text: "Login now",style: TextStyle(
                    color: Colors.black,decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                  ..onTap=() {
                    nextScreen(context, LoginPage());
                  }
                )
              ])
              
              )
            ],
          ),
        ) ,
    ));
  }
  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          await HelperFunctons.saveUserLoggedInStatus(true);
          await HelperFunctons.saveUserEmailSF(email);
          await HelperFunctons.saveUserNameSF(fullName);
          nextScreenReplace(context,  HomePage());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}