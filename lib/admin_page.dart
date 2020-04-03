import 'package:flutter/material.dart';
import 'package:food_app/login.dart';
import 'profile_page.dart';
import 'setting.dart';
import 'main.dart';
import 'setting_password.dart';

class AdminPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text('FoodRing'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications, color: Colors.white,),
          onPressed: null,
          ),
          // IconButton(icon: Icon(Icons.exit_to_app, color: Colors.white),
          // onPressed:null,
          
          // ),
        ],
      ),

      drawer: Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Kang Wei Kiat', style: TextStyle(fontSize: 22.0, color:Colors.white)),
            accountEmail: Text('TeamCoconut@gmail.com') ,
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor:  Colors.white,
                // child: Icon(Icons.android, size: 60.0, color: Colors.black),
                backgroundImage: AssetImage('assets/android.png'),
                
              )
            ),
            decoration: BoxDecoration(color: Colors.indigo),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdminPage()),
              );

            },
            child: ListTile(
              title: Text('Home', style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.home, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: ListTile(
              title: Text('User Profile', style: TextStyle(color:Colors.black)),
              leading: Icon(Icons.person, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
            child: ListTile(
              title: Text('Settings', style: TextStyle(color:Colors.black)),
              leading: Icon(Icons.settings, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Help', style: TextStyle(color:Colors.black)),
              leading: Icon(Icons.help_outline, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: ListTile(
              title: Text('Log Out', style: TextStyle(color:Colors.black)),
              leading: Icon(Icons.exit_to_app, color: Colors.black),
            ),
          ),
        ],)
      ),

    );
  }
}