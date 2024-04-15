import 'package:flutter/material.dart';
import '../../wigets/button.dart';
import '../../wigets/textfield.dart';
import '../../Models/users.dart';
import 'login.dart';

import '../../DB%20&%20Controllers/database_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  //Controllers
  final fullName = TextEditingController();
  final email = TextEditingController();
  final usrName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final db = DatabaseHelper();
  signUp()async{
    var res = await db.createUser(Users(fullName: fullName.text,email: email.text,usrName: usrName.text, password: password.text,usrType: 1));
    if(res>0){
      if(!mounted)return;
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
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
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 child: Text("Register New Account",style: TextStyle(color: Color.fromARGB(255, 0, 100, 100),fontSize: 55,fontWeight: FontWeight.bold),),
               ),

                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/default.jpg'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InputField(hint: "Full name", icon: Icons.person, controller: fullName),
                InputField(hint: "Email", icon: Icons.email, controller: email),
                InputField(hint: "Username", icon: Icons.account_circle, controller: usrName),
                InputField(hint: "Password", icon: Icons.lock, controller: password,passwordInvisible: true),
                InputField(hint: "Re-enter password", icon: Icons.lock, controller: confirmPassword,passwordInvisible: true),

                const SizedBox(height: 10),
                Button(label: "SIGN UP", press: (){
                  print("${email.text} ${fullName.text} ${usrName.text} ${password.text} ${confirmPassword.text}");
                  // check if the email contains @ forme like aymane@gmail.com with regular expressions
                  if(email.text == '' || fullName.text == '' || usrName.text == '' || password.text == '' ||confirmPassword.text == ''){
                    print("check");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All fields are required'))
                    );
                    return;
                  }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.text)){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid email format'))
                    );
                    return;
                  }
                  signUp();
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",style: TextStyle(color: Colors.grey),),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                        },
                        child: const Text("LOGIN"))
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
