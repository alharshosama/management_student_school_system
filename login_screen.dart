
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/Data/db_helper.dart';

import '../Student/Student.dart';
import '../widget/coustom_appar.dart';
import '../widget/coustom_drawer.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPassword =false;
  @override
  void _login() async {

    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      //DatabaseHelper _databaseHelper = DatabaseHelper();
      DbHelper dbHelper= DbHelper();

      final authenticatedUser = await dbHelper.authenticateUser(username, password );

      if (authenticatedUser != null) {
        // User authenticated, navigate to the home page
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>StudentsPage()));
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Authentication Failed'),
            content: Text('Invalid username or password.'),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.black87, // foreground
                    backgroundColor: Colors.teal),
                child:const Text('OK'),
                onPressed: () => Navigator.of(ctx).pop(true),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("Login System"),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,


              children: [
                SizedBox(
                  height: 60,
                ),
                CircleAvatar(
                  maxRadius:100.0 ,
                  // backgroundColor: Colors.red,
                  backgroundImage: NetworkImage("https://media.istockphoto.com/id/1426988809/photo/security-password-login-online-concept-hands-typing-and-entering-username-and-password-of.webp?b=1&s=170667a&w=0&k=20&c=AJD5Wv30lmyILccJyMpQGhkmh0VhZ5WNDtk53MO1OVM="),
                ),
                SizedBox(height: 20,),
                Text(
                  "Login your system !",

                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight:FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40,),
                TextFormField(
                  controller:_usernameController,
                  keyboardType:TextInputType.name,
                  onFieldSubmitted: (String value){
                    print(value);
                  },
                  onChanged: (String value){
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: "UserName",

                    prefixIcon: Icon(
                      Icons.verified_user_sharp,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller:_passwordController,
                  keyboardType:TextInputType.visiblePassword,
                  obscureText: isPassword,
                  // onFieldSubmitted: (String value){
                  //  print(value);
                  // },
                  // onChanged: (String value){
                  //   print(value);
                  // },
                  decoration: InputDecoration(
                    labelText: "Password",

                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                     setState(() {
                       isPassword= !isPassword;
                     });
                      },
                      icon: Icon(
                        isPassword? Icons.remove_red_eye:Icons.visibility_off,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: MaterialButton(
                    onPressed: (){
                      _login();


                    },

                    child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                SizedBox(
                  height: 10.0,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Don\'t have account',
                //     ),
                //     // TextButton(
                //     //   onPressed: () {},
                //     //   // child:Text(
                //     //   //   "Register Now",
                //     //   // ),
                //     // ),
                //   ],
                // ),

              ],
            ),
          ),

              ),

          ),


    );







  }
}