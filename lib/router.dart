import 'package:amazon_new/common/widgets/bottom_bar.dart';
import 'package:amazon_new/features/admin/screens/add_products_screen.dart';
import 'package:amazon_new/features/home/screens/category_deals_screen.dart';
import 'package:amazon_new/features/home/screens/home_screen.dart';
import 'package:amazon_new/features/auth/screens/auth_screen.dart';
import 'package:amazon_new/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_new/features/search/screens/search_screen.dart';
import 'package:amazon_new/models/product.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthScreen());

    case BottomBar.routeName:
      return MaterialPageRoute(builder: (_) => const BottomBar());

    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CategoryDealsScreen(category: category),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductScreen());

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => SearchScreen(searchQuery: searchQuery),
      );

    case DetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(builder: (_) => DetailsScreen(product: product));

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Screen doesn\'t exist'))),
      );
  }
}
