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

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black87,
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
    );
    return Text(
      _fullName,
      style: _nameTextStyle,
    );
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
                  _buildFullName(),
                ],
              ),
            ))
          ],
        ));
  }
}
