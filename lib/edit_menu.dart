


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditMenu extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("Edit Menu"),
        
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left:16.0),
                          child: myDetailsContainer1(),
                        )

                      ),
                      Container(
                        width: 150,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            image: AssetImage('assets/slider/slider2.jpg'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topRight,

                          )
                        ),
                      )

                    ],
                  ),
                )
              ),
            )
          ),
            Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left:16.0),
                          child: myDetailsContainer2(),
                        )

                      ),
                      Container(
                        width: 150,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            image: AssetImage('assets/slider/slider1.jpg'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topRight,

                          )
                        ),
                      )

                    ],
                  ),
                )
              ),
            )
          ),

            Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left:16.0),
                          child: myDetailsContainer3(),
                        )

                      ),
                      Container(
                        width: 150,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            image: AssetImage('assets/slider/slider3.jpg'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topRight,

                          )
                        ),
                      )

                    ],
                  ),
                )
              ),
            )
          )


        ],
      ) ,



      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}

  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Pizza",
            style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Row(children: <Widget>[
            Container(child: Text("Mushroom",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
            Container(child: Text("\u00B7 30 min",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
          ],)),
        ),
        Container(child: Text("RM16.90",
          style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
      ],
    );
  }

  Widget myDetailsContainer2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Chicken Chop",
            style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Row(children: <Widget>[
            Container(child: Text("Black papper",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
            Container(child: Text("\u00B7 15 min",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
          ],)),
        ),
        Container(child: Text("RM18.90",
          style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
      ],
    );
  }

  Widget myDetailsContainer3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Beef Burger",
            style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Row(children: <Widget>[
            Container(child: Text("Recommended",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
            Container(child: Text("\u00B7 10 min",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
          ],)),
        ),
        Container(child: Text("RM12.90",
          style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
      ],
    );
  }

