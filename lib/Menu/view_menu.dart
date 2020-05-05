import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewMenu extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("View Menu"),
        
      ),
      body: ListView.separated(itemBuilder: (context,index)=>ListTile(
        contentPadding: const EdgeInsets.all(5.0),   
        title: Text("Food Name", style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold)),
        subtitle:Text("RM XX", style: TextStyle(color: Colors.black54, fontSize: 18.0,)),
        trailing: Container(
          height: 150.0,
          width: 150.0,
          child:ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
              'assets/slider/slider2.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center
              ),
            ),
          ),
          onTap: (){},
      ),
      separatorBuilder: (context,index)=>Divider(color: Colors.blueGrey,), itemCount: 4),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}




