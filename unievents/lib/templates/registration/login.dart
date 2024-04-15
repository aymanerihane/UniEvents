import 'package:flutter/material.dart';
import '../../Components/button.dart';
import '../../themes/themes.dart';
import '../../Components/textfield.dart';
import '../../JSON/users.dart';
import 'package:provider/provider.dart'; // Import Provider

import '../drawer/hidden_drawer.dart';

import 'signup.dart';


import '../../SQLite/database_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Our controllers
  //Controller is used to take the value from user and pass it to database
  final usrName = TextEditingController();
  final password = TextEditingController();

  bool isChecked = false;
  bool isLoginTrue = false;

  final db = DatabaseHelper();
  //Login Method
  //We will take the value of text fields using controllers in order to verify whether details are correct or not
  login() async {
  var res = await db.authenticate(Users(usrName: usrName.text, password: password.text));
  if (res == true) {
    // If authentication is successful, set the current user in DatabaseHelper
    // Provider.of<DatabaseHelper>(context, listen: false).setCurrentUser(Users(usrName: usrName.text, password: password.text));

    // Navigate to the profile or home screen
    if (!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Hidden_Drawer()));
  } else {
    // Otherwise, show the error message
    setState(() {
      isLoginTrue = true;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Because we don't have account, we must create one to authenticate
                //lets go to sign up

                const Text("LOGIN",style: TextStyle(color: primaryColor,fontSize: 40),),
                Image.asset("assets/images/background.avif"),
                InputField(hint: "Username", icon: Icons.account_circle, controller: usrName),
                InputField(hint: "Password", icon: Icons.lock, controller: password,passwordInvisible: true),

                ListTile(
                  horizontalTitleGap: 2,
                  title: const Text("Remember me"),
                  leading: Checkbox(
                    activeColor: primaryColor,
                    value: isChecked,
                    onChanged: (value){
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),
                ),

                //Our login button
                Button(label: "LOGIN", press: (){
                login();

                }),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",style: TextStyle(color: Colors.grey),),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupScreen()));
                        },
                        child: const Text("SIGN UP"))
                  ],
                ),

                 // Access denied message in case when your username and password is incorrect
                //By default we must hide it
                 //When login is not true then display the message
                 isLoginTrue? Text("Username or password is incorrect",style: TextStyle(color: Colors.red.shade900),):const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
