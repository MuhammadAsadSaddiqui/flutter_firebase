import 'package:flutter/material.dart';

class GridIcons {
  static List<IconData> getIconList() {
    List<IconData> iconList = [];
    iconList
      ..add(Icons.local_cafe)        // Coffee cup
      ..add(Icons.coffee)           // Coffee brewing
      ..add(Icons.cake)             // Cake or desserts
      ..add(Icons.kitchen)          // Kitchen tools
      ..add(Icons.local_dining)     // Dining icon
      ..add(Icons.star)             // Favorite or featured
      ..add(Icons.favorite_border)  // Like or favorite
      ..add(Icons.local_bar)        // Coffee bar
      ..add(Icons.free_breakfast)   // Another coffee cup
      ..add(Icons.local_drink)      // Drinks
      ..add(Icons.sentiment_satisfied) // Satisfied customer
      ..add(Icons.cloud_queue)      // Aroma or freshness
      ..add(Icons.edit_location)    // Location for coffee shops
      ..add(Icons.event_seat)       // Seating arrangements
      ..add(Icons.lightbulb_outline); // Innovative coffee ideas
    return iconList;
  }
}
