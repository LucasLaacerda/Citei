import 'package:flutter/material.dart';
import 'package:Citei/app_controller.dart';

import 'home_page.dart';
import 'login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(builder: (context,child) {  
      return MaterialApp(
            title: 'Citei',
            theme: ThemeData(
              primarySwatch: Colors.red,
              brightness: AppController.instance.isDartTheme? Brightness.dark:Brightness.light,
            ),
            //home: MyHomePage(title: 'Flutter Demo Home Page'),
            //home: LoginPage(),
            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => MyHomePage()
            },
          );

    }, animation: AppController.instance
);


    
  }
}
