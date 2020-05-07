import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Menu/edit_menu.dart';

class ViewMenu extends StatefulWidget {
  final List _foodItems;
  ViewMenu(this._foodItems);
  @override
  _ViewMenuState createState() => _ViewMenuState();
}

class _ViewMenuState extends State<ViewMenu> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("View Menu"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                contentPadding: const EdgeInsets.all(5.0),
                title: Text(widget._foodItems[index].foodName,
                    style: TextStyle(
                        color: Colors.orange[900],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Price: RM" +
                              widget._foodItems[index].unitPrice
                                  .toStringAsFixed(2),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          widget._foodItems[index].foodDescription,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                ),
                trailing: Container(
                  height: 80.0,
                  width: 80.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(widget._foodItems[index].imageName,
                        fit: BoxFit.cover, alignment: Alignment.center),
                  ),
                ),
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditMenu(widget._foodItems[index])),
                  );
                },
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
          itemCount: widget._foodItems.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
