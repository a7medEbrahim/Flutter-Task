import 'package:flutter/material.dart';
import 'package:fluttertask/presentation/pages/product_page.dart';
import 'package:go_router/go_router.dart';

class RoutesName {
  static const String product = "/";
}

class AppRoutes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: RoutesName.product,
        builder: (context, state) => const ProductsPage(),
      ),
    ],
  );
}
