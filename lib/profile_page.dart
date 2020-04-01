import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String _fullName = "Kang Wei Kiat ";
  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 2.6,
      decoration: BoxDecoration(
        color: Colors.tealAccent,
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
        child: Container(
            width: 140.0,
            height: 140.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/android.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(80.0),
              border: Border.all(
                color: Colors.white,
                width: 10.0,
              ),
            )));
  }

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'User Profile',
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
            _buildCoverImage(screenSize),
            SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.4),
                  _buildProfileImage(),
                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.verified_user,
                          color: Colors.teal[900],
                        ),
                        title: Text(
                          _fullName,
                          style: TextStyle(
                              fontFamily: 'BalooBhai', fontSize: 20.0),
                        ),
                      )),
                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.teal[900],
                        ),
                        title: Text(
                          '+91 85465XXX8XX',
                          style: TextStyle(
                              fontFamily: 'BalooBhai', fontSize: 20.0),
                        ),
                      )),
                ],
              ),
            ))
          ],
        ));
  }
}
