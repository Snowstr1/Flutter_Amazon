import 'package:amazon_new/common/widgets/bottom_bar.dart';
import 'package:amazon_new/features/admin/screens/add_products_screen.dart';
import 'package:amazon_new/features/auth/home/screens/home_screen.dart';
import 'package:amazon_new/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthScreen());

    case BottomBar.routeName:
      return MaterialPageRoute(builder: (_) => const BottomBar());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AddProductsScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductsScreen());
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Screen doesn\'t exist'))),
      );
  }
}
