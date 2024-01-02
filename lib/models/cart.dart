import 'package:flutter/material.dart';
import 'package:shoe_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shopShoe = [
    Shoe(
      name: 'Air Shoe',
      price: '₹2000.00',
      imagePath: 'lib/images/shoe2.png',
      description: 'Comfort plays the role',
    ),
    Shoe(
      name: 'Spring Shoe',
      price: '₹4000.00',
      imagePath: 'lib/images/shoe3.png',
      description: 'Actions keeps us comfort',
    ),
    Shoe(
      name: 'Leather Shoe',
      price: '₹8000.00',
      imagePath: 'lib/images/shoe4.png',
      description: 'Feel the luxury',
    ),
  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shopShoe;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add item to the cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item form the cart
  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
