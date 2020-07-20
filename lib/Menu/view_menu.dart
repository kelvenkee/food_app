import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:food_app/Menu/edit_menu.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/models/fooditem.dart';
import 'package:food_app/service/fooditem_data_service.dart';



class ViewMenu extends StatefulWidget {
  ViewMenu();
  @override
  _ViewMenuState createState() => _ViewMenuState();
}

class _ViewMenuState extends State<ViewMenu> {
  List<FoodItem> _fooditems;
  final dataService = FoodItemDataService();

  // void _navigate(int index) async{
  //   FoodItem returnData= await Navigator.push(
  //     context, 
  //     MaterialPageRoute(
  //       builder: (context)=>
  //         EditMenu(FoodItem.copy(widget._foodItems[index])),
  //       ),
  //   );
  //   if(returnData != null){
  //     //update data in the view menu screen
  //     //rebuild the screen (setState)
  //     setState(() => widget._foodItems[index]= returnData);
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FoodItem>>(
        future: dataService.getAllFoodItem(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _fooditems = snapshot.data;
            return _buildMainSceen();
          }
          return _buildFetchingDataScreen();
        });
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.deepOrangeAccent,
    //     centerTitle: true,
    //     title: Text("View Menu"),
    //   ),
    //   body: ListView.separated(
    //       itemBuilder: (context, index) => Dismissible( //DELETE BY SWIPPING 
    //         key: UniqueKey(), 
    //         onDismissed: (direction){
    //           setState(() {
    //             widget._foodItems.removeAt(index);
    //             Scaffold.of(context).showSnackBar(new SnackBar(
    //               content: new Text("One food is removed."),
    //             ));
    //           });
    //         },
    //         background: new Container(
    //           color: Colors.redAccent,
    //           child: Icon(Icons.delete, color: Colors.white, size: 40),
    //           alignment: AlignmentDirectional.centerEnd,
    //           ),
    //                   child: ListTile(
    //               contentPadding: const EdgeInsets.all(5.0),
    //               title: Text(widget._foodItems[index].foodName,
    //                   style: TextStyle(
    //                       color: Colors.orange[900],
    //                       fontSize: 18.0,
    //                       fontWeight: FontWeight.bold)),
    //               subtitle: Padding(
    //                 padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    //                 child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: <Widget>[
    //                       Text(
    //                         "Price: RM" +
    //                             widget._foodItems[index].unitPrice
    //                                 .toStringAsFixed(2),
    //                         style: TextStyle(
    //                           color: Colors.black54,
    //                           fontSize: 18.0,
    //                         ),
    //                         textAlign: TextAlign.justify,
    //                       ),
    //                       Text(
    //                         widget._foodItems[index].foodDescription,
    //                         style: TextStyle(
    //                           color: Colors.black54,
    //                           fontSize: 13.0,
    //                         ),
    //                         textAlign: TextAlign.justify,
    //                       ),
    //                     ]),
    //               ),
    //               trailing: Container(
    //                 height: 80.0,
    //                 width: 80.0,
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(8.0),
    //                   child: Image.asset(widget._foodItems[index].imageName,
    //                       fit: BoxFit.cover, alignment: Alignment.center),
    //                 ),
    //               ),
    //               onTap: () => _navigate(index),
    //             ),
    //       ),
    //       separatorBuilder: (context, index) => Divider(
    //             color: Colors.blueGrey,
    //           ),
    //       itemCount: widget._foodItems.length),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       Navigator.pushNamed(context, create_menuRoute); 
    //     },
    //     child: Icon(Icons.add),
    //     backgroundColor: Colors.deepOrangeAccent,
    //   ),
    // );
  }

  Scaffold _buildMainSceen(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("View Menu"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Dismissible( //DELETE BY SWIPPING 
            key: UniqueKey(), 
            onDismissed: (direction){
              setState(() {
                _fooditems.removeAt(index);
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("One food is removed."),
                ));
              });
            },
            background: new Container(
              color: Colors.redAccent,
              child: Icon(Icons.delete, color: Colors.white, size: 40),
              alignment: AlignmentDirectional.centerEnd,
              ),
                      child: ListTile(
                  contentPadding: const EdgeInsets.all(5.0),
                  title: Text(_fooditems[index].foodName,
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
                                _fooditems[index].unitPrice
                                    .toStringAsFixed(2),
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            _fooditems[index].foodDescription,
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
                      child: Image.asset(_fooditems[index].imageName,
                          fit: BoxFit.cover, alignment: Alignment.center),
                    ),
                  ),
                  // onTap: () => _navigate(index),
                ),
          ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
          itemCount: _fooditems.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, create_menuRoute); 
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }


  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching Food Menu... Please wait'),
          ],
        ),
      ),
    );
  }


}
