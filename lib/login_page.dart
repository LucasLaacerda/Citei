import 'package:flutter/material.dart';
import 'package:Citei/home_page.dart';

class LoginPage  extends StatefulWidget {
  @override
  _LoginPage  createState() => _LoginPage ();
}

class _LoginPage extends State<LoginPage> {

  String email = '';
  String password = '';


Widget _body(){
  return SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset('assets/images/logo.png'),
                          ),
                      SizedBox(height: 30),
                      Card(
                              elevation: 0,
                              color: Colors.transparent,
                              child: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 12),
                            child: Column(
                            children: [
                                      TextField(
                                    onChanged: (text){
                                      email = text;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                    labelText: 'Login',
                                    border: OutlineInputBorder()
                                  ),                 
                                ),

                                SizedBox(height: 10),
                                TextField( 
                                    onChanged: (text){
                                      password = text;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder()
                                  ),                 
                                ),
                                 SizedBox(height: 15),
                                 RaisedButton(
                                 color: Colors.red,
                                 textColor: Colors.white,
                                 onPressed: (){
                                    if(email=='lucas@gmail.com' && password=='teste'){
                                        Navigator.of(context).pushReplacementNamed('/home');
                                    }else{
                                        print('Login Incorreto');
                                    }

                                }, 
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Entrar',
                                    textAlign: TextAlign.center,
                                  )),
                                )
                              ],
                          ),
                        )
                      ),
                     
                    ],
                  ),
          ),
        ),
      );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children:[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/back.png',
              fit: BoxFit.cover,)),
              Container(
                color: Colors.black.withOpacity(0.2),
              ),
          _body(),
        ]
      ),    
    );
  }
}