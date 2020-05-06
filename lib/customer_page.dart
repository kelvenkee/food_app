import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';

class CustomerPage extends StatefulWidget {
  final List _foodItems;
  CustomerPage(this._foodItems);
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text('Menu'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: null,
            tooltip: 'Checkout',
          )
        ],
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
                  Navigator.pushNamed(
                    context,
                    food_detailRoute,
                    arguments: widget._foodItems[index],
                  );
                },
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
          itemCount: widget._foodItems.length),
      // body: ListView(
      //   scrollDirection: Axis.vertical,
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(builder: (context) => FoodDetail()),
      //                 );
      //               },
      //               child: Row(
      //                 children: <Widget>[
      //                   Container(
      //                     child: myDetailsContainer1(),
      //                   ),
      //                   Container(
      //                     child: ClipRRect(
      //                       borderRadius: new BorderRadius.circular(24.0),
      //                       child: Image(
      //                           width: 150,
      //                           height: 100,
      //                           fit: BoxFit.contain,
      //                           alignment: Alignment.topRight,
      //                           image:
      //                               AssetImage('assets/slider/slider1.jpg')),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
