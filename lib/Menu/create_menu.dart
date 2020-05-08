import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/fooditem.dart';
import 'package:food_app/models/mockdata.dart';

class CreateMenu extends StatefulWidget {
  CreateMenu();
  @override
  _CreateMenuState createState() => _CreateMenuState();
}

class _CreateMenuState extends State<CreateMenu> {
  String foodName;
  String foodDescription;
  double unitPrice;
  String imageName;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              leading: Container(),
              backgroundColor: Colors.deepOrangeAccent,
              centerTitle: true,
              title: Text("Create Menu"),
            ),
            body: Column(children: <Widget>[
              SizedBox(height: 20),
              _buildImage(),
              _buildBody(),
            ])));
  }

  Widget _buildImage() {
    return Container(
      height: 150,
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          "assets/fooditemsimage/fooditemsimage1.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.all(28),
        child: Column(
          children: <Widget>[
            TextFormField(
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                labelText: "Food Name:",
                hintText: "Enter a food name",
              ),
              keyboardType: TextInputType.text,
              onChanged: (newValue) => setState(() => foodName = newValue),
            ),
            SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 25,
                color: Colors.redAccent,
              ),
              decoration: InputDecoration(
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                labelText: "Price(RM): ",
                hintText: "Enter price ...",
              ),
              onChanged: (newValue) =>
                  setState(() => unitPrice = double.parse(newValue)),
            ),
            SizedBox(width: 10),
            SizedBox(height: 5),
            TextFormField(
              style: TextStyle(fontSize: 18),
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Food Description: ",
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                hintText: "Enter food description. . .",
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              ),
              keyboardType: TextInputType.text,
              onChanged: (newValue) =>
                  setState(() => foodDescription = newValue),
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton.extended(
                  heroTag: null,
                  icon: Icon(Icons.check_circle),
                  label: Text("Save"),
                  // onPressed: ()=> Navigator.pop(context, widget._foodItems) ,
                  onPressed: () {
                    // FoodItem mockFoodItem= new FoodItem(
                    //   foodID: "11",
                    //   foodName: "widget._foodItems.foodName " ,
                    //   foodDescription: "widget._foodItems.foodDescription" ,
                    //   unitPrice: 99,
                    //   imageName: "assets/fooditemsimage/fooditemsimage1.jpg",
                    //   );
                    //   createFoodMenu(mockFoodItem);
                    //   Navigator.pop(context, FoodItem);
                    String foodId =
                        getId(mockFoodItem[mockFoodItem.length - 1].foodID);
                    FoodItem tempFood = new FoodItem(
                        foodID: foodId,
                        foodName: foodName,
                        foodDescription: foodDescription,
                        unitPrice: unitPrice,
                        imageName: "test");
                    mockFoodItem.add(tempFood);
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                SizedBox(width: 15),
                FloatingActionButton.extended(
                  heroTag: null,
                  icon: Icon(Icons.cancel),
                  label: Text("Cancel"),
                  onPressed: () => Navigator.pop(context, null),
                  backgroundColor: Colors.deepOrangeAccent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void createFoodMenu(FoodItem foodItem) {
    return setState(() {
      addMenu(foodItem);
    });
  }

  String getId(String id) {
    int realid = int.parse(id);
    realid += 1;

    return realid.toString();
  }
}
