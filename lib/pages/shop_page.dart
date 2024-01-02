import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop/components/shoe_tile.dart';
import 'package:shoe_shop/models/cart.dart';
import 'package:shoe_shop/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add show to cart
  void addShoeCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // show alert box for cart added successfully
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Successfully added',
          style: GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: Text(
          'Check your cart...',
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[700],
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),

          // messagge
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "Walk your path in style,",
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // hot picks
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks ❤️‍🔥',
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'See all',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get the shoe
                Shoe shoe = value.getShoeList()[index];
                // return the shoe
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeCart(shoe),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: Divider(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
