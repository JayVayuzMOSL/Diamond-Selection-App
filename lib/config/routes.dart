import 'package:flutter/material.dart';
import 'package:kgk_diamonds_group_app/presentation/pages/cart_page.dart';
import 'package:kgk_diamonds_group_app/presentation/pages/filter_page.dart';
import 'package:kgk_diamonds_group_app/presentation/pages/home_page.dart';
import 'package:kgk_diamonds_group_app/presentation/pages/result_page.dart';

class AppRoutes {
  static const String homePage = '/';
  static const String resultPage = '/result';
  static const String filterPage = '/filter';
  static const String cartPage = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case resultPage:
        return MaterialPageRoute(builder: (_) => ResultPage());

      case filterPage:
        return MaterialPageRoute(builder: (_) => FilterPage());

      case cartPage:
        return MaterialPageRoute(builder: (_) => CartPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
