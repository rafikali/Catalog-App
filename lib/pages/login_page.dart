import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helloworld/utiils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png",
            fit: BoxFit.cover,
          ),
           const SizedBox(
             height: 14.0,
           ),
           Text(
            "Welcome $name",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
           const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration:  InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username"
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name  = value;
                      setState(() {

                      });
                  },
                  ),


                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Password can't be empty";
                      }
                      else if (value.length > 6) {
                        return "Password should be less than 6 letters";
                      }
                      return null;
                    },
                  ),

                 const SizedBox(
                    height: 20.0,
                   ),
                  InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton? 40:150,
                      height: 40,
                      alignment: Alignment.center,
                      child: changeButton?
                      const Icon(
                          Icons.done,
                          color:Colors.white
                      ): const Text(
                          'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                      ),),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(changeButton? 50:8)
                      ),


                    ),

                  ),

                  // ElevatedButton(
                  //   style: TextButton.styleFrom(
                  //       minimumSize: const Size(120, 40),
                  //   ),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     },
                  //     child: Text("Login"),
                  // )
                ],


              ),
            ),
          )
        ],
      ),);
  }
}
