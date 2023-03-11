import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _HomeScreenState();
}
  

class _HomeScreenState extends State<SignUpScreen> {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void login(String email , String password) async{

    try{
      Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email' : email,
          'password' : password
        }
        );

        if(response.statusCode == 200)
        {
          var data = jsonDecode(response.body.toString());
          print(data);
          print('Response Succssfull');
        }else{
          print('Failed');
        }
    }

    catch(e){
        print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('Sign Up Api'))),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: 'Email'
                ) ,
              ),
              SizedBox(height: 25,),
               TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  hintText: 'Password'
                ) ,
              ),
                SizedBox(height: 40,),

                GestureDetector(
                  onTap: () {
                    login(emailcontroller.text.toString() , passwordcontroller.text.toString() );
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text('Sign Up' , style: TextStyle(fontSize: 25, color: Colors.white),)),
                  ),
                )
            ],
          ),
        ));
  }
}
