// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:Citei/app_controller.dart';
// ignore: unused_import
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _citacao = '';

  Future<void> _incrementCounter() async {
    List<List<dynamic>> data = [];
      final myData = await rootBundle.loadString("assets/quotes.csv");
      List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

      data = csvTable;
    
      Random random = new Random();
      int randomNumber = random.nextInt(8);
    setState(()  {
      _citacao = csvTable[0][randomNumber];
      _citacao = _citacao.replaceAll('/', ',');
      _citacao = _citacao.replaceAll('-', '     \n\n-');

    });
  }

  @override
  Widget build(BuildContext context) {
   
        return Scaffold(

          drawer: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/user.png"),),
                  accountName: Text('Lucas Lacerda'), 
                  accountEmail: Text('lucas@gmail.com')),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  subtitle: Text('Tela Inicial'),
                  onTap: (){
                     Navigator.of(context).pushReplacementNamed('/home');
                  },
                ),
                SwitchListTile(
                    title: const Text('Lights'),
                    value: !AppController.instance.isDartTheme,
                    onChanged: (bool value) {
                      AppController.instance.changeTheme();  
                    },
                    secondary: const Icon(Icons.lightbulb_outline),
                  ),
                 ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sair'),
                  subtitle: Text('Finalizar sessão'),
                  onTap: (){
                     Navigator.of(context).pushReplacementNamed('/');
                  },
                ),
              ],
            ),),


          appBar: AppBar(
           
            title: Text('Citei!'),
            
          ),
     
        
          body: 
    
          Center(
           
              child: 
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                   
                        child: Padding(          
                          padding: const EdgeInsets.all(24.0),

                            child: Column(
                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[    
                              
                                 
                                Text(                      
                                '"$_citacao      "',
                                 style:
                                  Theme.of(context).textTheme.headline4,
                                 
                                
                              ),
                             
                              
                ],
                
              ),
            ),
                  
                   
                  ),
                  
      ),
      
      

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
       value: AppController.instance.isDartTheme, 
       onChanged: (value){                    
        AppController.instance.changeTheme();
       });
  }
}