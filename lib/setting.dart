import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'main.dart';

class SettingPage extends StatelessWidget {
  static final String path = "lib\setting.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
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
                      color: Colors.indigo,
                    )),
                Card(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      "Kang Wei Kiat",
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/android.png'),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                ),
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
