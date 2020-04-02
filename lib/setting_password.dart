import 'package:flutter/material.dart';

class SettingPasswordPage extends StatelessWidget {
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: screenSize.height / 6.4),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.vpn_key,
                        color: Colors.red[900],
                      ),
                      title: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Old Password',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),
                    )),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.vpn_key,
                        color: Colors.lightGreen,
                      ),
                      title: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),
                    )),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.vpn_key,
                        color: Colors.lightGreen,
                      ),
                      title: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Confirm New Password',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),
                    )),
                
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                    "Password must be at least 8 characters and include a special character and number",
                    style: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                ),
                
                ListTile(
                    title: RaisedButton(
                  child: Text('Save Changes'),
                  onPressed: () {},
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
