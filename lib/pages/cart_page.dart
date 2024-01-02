import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop/components/cart_list.dart';
import 'package:shoe_shop/models/cart.dart';
import 'package:shoe_shop/models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text
            Text(
              'My Cart',
              style: GoogleFonts.outfit(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),

            // list tile
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  // get a shoe from shop list
                  Shoe individualshoee = value.getUserCart()[index];

                  // return the cart item
                  return CartList(shoe: individualshoee);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
