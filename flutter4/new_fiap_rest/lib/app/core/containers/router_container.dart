import 'package:go_router/go_router.dart';
import 'package:new_fiap_rest/app/features/home/router/home_router_container.dart'
    as home;

final getRoutes = GoRouter(
  routes: [
    ...home.getRouterContainer,
  ],
);
