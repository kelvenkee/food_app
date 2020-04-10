import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewOrder extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("View Order"),
        
      ),
      body: GridView.count(
        crossAxisCount:2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 0.9,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: <Widget>[
          tableItems("TABLE 1", "assets/slider/slider1.jpg", Colors.red, Colors.indigo),
          tableItems("TABLE 2", "assets/slider/slider2.jpg", Colors.orange , Colors.indigo),
          tableItems("TABLE 3", "assets/slider/slider3.jpg", Colors.yellow , Colors.indigo),
          tableItems("TABLE 4", "assets/slider/slider4.jpg", Colors.green, Colors.indigo),
          tableItems("TABLE 5", "assets/slider/slider5.jpg", Colors.blue , Colors.indigo) ,
          tableItems("TABLE 6", "assets/slider/slider1.jpg", Colors.black45 , Colors.indigo) ,


        ],
        )   
    );
  }


  Widget tableItems(String tableName, String tableImage, Color color1, Color color2){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        gradient: new LinearGradient(
          colors:[color1, color2],
          begin: Alignment.centerLeft,
          end: new Alignment(1.0, 1.0),
        )
      ),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                image: DecorationImage(
                  image: AssetImage(tableImage),
                  fit: BoxFit.fill, 
                  ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:16.0),
                child:Text(tableName, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                )
            ],
          )

        ]
      ),


    );
  }
}