import 'package:flutter/material.dart';
import 'profile_page.dart';
import '../main.dart';
import 'setting_password.dart';

class SettingPage extends StatelessWidget {
  static final String path = "lib\setting.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Setting',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Account',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[400],
                    )),
                Card(
                  child: ListTile(
                    title: Text(
                      "Kang Wei Kiat",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "Change Password",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingPasswordPage()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 25.0),
                Text('Push Notification',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[400],
                    )),
                SwitchListTile(
                  value: true,
                  activeColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    "Order Updates",
                    style: TextStyle(color: Colors.black),
                  ),
                  onChanged: (val) {
                    print(val);
                  },
                )
              ])),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.grey,
        elevation: 4.0,
        icon: const Icon(Icons.exit_to_app),
        label: const Text('Logout'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodApp()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
