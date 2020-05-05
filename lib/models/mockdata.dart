import 'customer.dart';
import 'order.dart';
import 'orderitem.dart';
import 'fooditem.dart';

List<FoodItem> mockFoodItem = [
  FoodItem(
      //mockFoodItem[0]
      foodName: "Hawaii Supreme Pizza",
      foodDescription:
          "Loads of delicious roasted chicken, shredded chicken juicy pineapples and fresh mushrooms on our brand new pizza.",
      unitPrice: 25.0,
      imageName: 'assets/fooditemsimage/fooditemsimage1.jpg'),
  FoodItem(
      //mockFoodItem[1]
      foodName: "Chicken Chop with Black Pepper Sauce",
      foodDescription:
          "Boneless chicken tenders perfectly marinated and battered, so every bite is crispy yet soft. Baked till golden and best paired with dill dipping sauce.",
      unitPrice: 12.50,
      imageName: 'assets/fooditemsimage/fooditemsimage2.jpg'),
  FoodItem(
      //mockFoodItem[2]
      foodName: "Fish Fillet Burger",
      foodDescription:
          "A classic favourite of a fish burger served with tartar sauce and cheddar cheese in a steamed bun.",
      unitPrice: 8.90,
      imageName: 'assets/fooditemsimage/fooditemsimage3.jpg'),
  FoodItem(
      //mockFoodItem[3]
      foodName: "Nasi Goreng Kampung",
      foodDescription:
          "A traditional Malay style fried rice, also known as Village style fried rice with the fragrant of spices and a hint of chilli.",
      unitPrice: 25.0,
      imageName: 'assets/fooditemsimage/fooditemsimage4.jpg'),
  FoodItem(
      //mockFoodItem[4]
      foodName: "Spicy Nacho Cheese Wedges",
      foodDescription:
          "Four Cheese Wedges filled with spicy Jalapeno slices, served with sour cream & chive dip.",
      unitPrice: 5.60,
      imageName: 'assets/fooditemsimage/fooditemsimage5.jpg'),
  FoodItem(
      //mockFoodItem[5]
      foodName: "Spaghetti With Chicken Bolognese",
      foodDescription:
          "Spaghetti with traditional mince chincken meat in a fresh tomato sauce.",
      unitPrice: 13.9,
      imageName: 'assets/fooditemsimage/fooditemsimage6.jpg'),
  FoodItem(
      //mockFoodItem[6]
      foodName: "Red Velvet Cake",
      foodDescription:
          "Cake that is fluffy, soft, buttery and moist with the most perfect velvet texture.",
      unitPrice: 9.90,
      imageName: 'assets/fooditemsimage/fooditemsimage7.jpg'),
  FoodItem(
      //mockFoodItem[7]
      foodName: "Honeydew Juice",
      foodDescription:
          "A fresh and fruity beverage made with sweet honeydew imported from Japan.",
      unitPrice: 8.80,
      imageName: 'assets/fooditemsimage/fooditemsimage8.jpg'),
  FoodItem(
      //mockFoodItem[8]
      foodName: "Milo Dinosaur",
      foodDescription:
          "A Malaysian beverage, composed of a cup of iced Milo with undissolved Milo powder added on top of it.",
      unitPrice: 25.0,
      imageName: 'assets/fooditemsimage/fooditemsimage9.jpg'),
  FoodItem(
      //mockFoodItem[9]
      foodName: "Cendol with Musang King Durian",
      foodDescription:
          "Iced sweet dessert with droplets of green rice flour jelly, coconut milk and palm sugar syrup. Comes together with Musang King Durian",
      unitPrice: 3.90,
      imageName: 'assets/fooditemsimage/fooditemsimage10.jpg'),
];

List<Customer> mockCustomer = [
  Customer(
      firstname: "Wei Kiat",
      lastname: "Kang",
      email: "weikiat@gmail.com",
      phone: "017-1235599"),
  Customer(
      firstname: "Sing Hua",
      lastname: "Wong",
      email: "singhua@yahoo.com",
      phone: "012-5588964"),
  Customer(
      firstname: "Lit Kwong",
      lastname: "Wong",
      email: "litkwong@hotmail.com",
      phone: "019-8865423"),
  Customer(
      firstname: "Kelven",
      lastname: "Kee",
      email: "kelven@gmail.com",
      phone: "017-4568596"),
];

List<Order> mockOrder = [
  Order(
      items: mockOrderItem0,
      customer: mockCustomer[0],
      orderStatus: "In Process"),
  Order(
      items: mockOrderItem1,
      customer: mockCustomer[1],
      orderStatus: "In Process"),
  Order(
      items: mockOrderItem2,
      customer: mockCustomer[1],
      orderStatus: "In Process"),
  Order(
      items: mockOrderItem3,
      customer: mockCustomer[2],
      orderStatus: "Completed"),
  Order(
      items: mockOrderItem4,
      customer: mockCustomer[3],
      orderStatus: "Completed"),
];

List<OrderItem> mockOrderItem0 = [
  OrderItem(
      fooditem: mockFoodItem[0], quantity: 1, orderItemStatus: "Completed"),
  OrderItem(
      fooditem: mockFoodItem[8], quantity: 1, orderItemStatus: "In Process"),
  OrderItem(
      fooditem: mockFoodItem[5], quantity: 1, orderItemStatus: "In Process"),
];

List<OrderItem> mockOrderItem1 = [
  OrderItem(
      fooditem: mockFoodItem[1], quantity: 1, orderItemStatus: "In Process"),
  OrderItem(
      fooditem: mockFoodItem[8], quantity: 3, orderItemStatus: "In Process"),
];

List<OrderItem> mockOrderItem2 = [
  OrderItem(
      fooditem: mockFoodItem[2], quantity: 5, orderItemStatus: "In Process"),
];

List<OrderItem> mockOrderItem3 = [
  OrderItem(
      fooditem: mockFoodItem[1], quantity: 1, orderItemStatus: "Completed"),
  OrderItem(
      fooditem: mockFoodItem[2], quantity: 1, orderItemStatus: "Completed"),
  OrderItem(
      fooditem: mockFoodItem[3], quantity: 1, orderItemStatus: "Completed"),
  OrderItem(
      fooditem: mockFoodItem[4], quantity: 1, orderItemStatus: "Completed"),
  OrderItem(
      fooditem: mockFoodItem[9], quantity: 12, orderItemStatus: "Completed"),
];

List<OrderItem> mockOrderItem4 = [
  OrderItem(
      fooditem: mockFoodItem[5], quantity: 1, orderItemStatus: "Completed"),
  OrderItem(
      fooditem: mockFoodItem[7], quantity: 1, orderItemStatus: "Completed"),
];
