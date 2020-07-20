import 'package:food_app/models/fooditem.dart';

import './rest_service.dart';


class FoodItemDataService {

  static final FoodItemDataService _instance = FoodItemDataService._constructor();
  factory FoodItemDataService() {
    return _instance;
  }

  FoodItemDataService._constructor();
  final rest = RestService();

  Future<List<FoodItem>> getAllFoodItem() async {
    final listJson = await rest.get('fooditem');

    return (listJson as List)
        .map((itemJson) => FoodItem.fromJson(itemJson))
        .toList();
  }

  Future deleteFoodItem({String id}) async {
    await rest.delete('fooditem/$id');
  }

  Future<FoodItem> createFoodItem({FoodItem fooditem}) async {
    final json = await rest.post('fooditem', data: fooditem);
    return FoodItem.fromJson(json);
  }

  Future<FoodItem> getFoodItem({String id}) async {
    final json = await rest.get('fooditem/$id/');
    return FoodItem.fromJson(json);
  }

  Future<FoodItem> updateFoodItem({String id}) async {
    final json = await rest.patch('fooditem/$id/', data: {});
    return FoodItem.fromJson(json);
  }

} // class 
