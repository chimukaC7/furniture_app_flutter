import 'package:flutter/material.dart';
import 'package:furniture_app_flutter/components/search_box.dart';
import 'package:furniture_app_flutter/constants.dart';
import 'package:furniture_app_flutter/models/product.dart';
import 'package:furniture_app_flutter/screens/details/details_screen.dart';

import 'category_list.dart';
import 'product_card.dart';

class Body extends StatelessWidget {

  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          SearchBox(onChanged: (value) {}),
          const CategoryList(),
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                ListView.builder(
                  // here we use our demo products list
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: products[index],
                    press: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => DetailsScreen( product: products[index],), ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
