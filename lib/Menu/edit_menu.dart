import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../models/fooditem.dart';
import '../service/fooditem_data_service.dart';

class EditMenu extends StatefulWidget {
  final String id;
  EditMenu(this.id);
  @override
  _EditMenuState createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  FoodItem _fooditems;
  final dataService = FoodItemDataService();
  Future<FoodItem> _futurefooditem;

  @override
  void initState() {
    super.initState();
    _futurefooditem = dataService.getFoodItem(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FoodItem>(
        future: _futurefooditem,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _fooditems = snapshot.data;
            return _buildMainSceen();
          }
          return _buildFetchingDataScreen();
        });
  }

  WillPopScope _buildMainSceen() {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              leading: Container(),
              backgroundColor: Colors.deepOrangeAccent,
              centerTitle: true,
              title: Text("Edit Menu"),
            ),
            body: Column(children: <Widget>[
              SizedBox(height: 20),
              _buildImage(),
              _buildBody(),
            ])));
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

  Widget _buildImage() {
    return Container(
      height: 150,
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          _fooditems.imageName,
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
              initialValue: _fooditems.foodName,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                labelText: "Food Name:",
                hintText: "Enter a food name",
              ),
              keyboardType: TextInputType.text,
              onChanged: (newValue) =>
                  setState(() => _fooditems.foodName = newValue),
            ),
            SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: _fooditems.unitPrice.toStringAsFixed(2),
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
                  setState(() => _fooditems.unitPrice = double.parse(newValue)),
            ),
            SizedBox(width: 10),
            SizedBox(height: 5),
            TextFormField(
              initialValue: _fooditems.foodDescription,
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
                  setState(() => _fooditems.foodDescription = newValue),
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton.extended(
                  heroTag: null,
                  icon: Icon(Icons.check_circle),
                  label: Text("Save"),
                  onPressed: () => {  
                    _futurefooditem=   dataService.updateFoodItem(widget.id, _fooditems),                
                    Navigator.popUntil(context, ModalRoute.withName(admin_pageRoute))
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
}