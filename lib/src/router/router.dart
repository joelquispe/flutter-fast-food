import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/ui/screens/addresses/addresses.screen.dart';
import 'package:ecommercesmall/src/ui/screens/cart/cart.screen.dart';
import 'package:ecommercesmall/src/ui/screens/checkout/checkout.screen.dart';
import 'package:ecommercesmall/src/ui/screens/home/home.screen.dart';
import 'package:ecommercesmall/src/ui/screens/login/login.screen.dart';
import 'package:ecommercesmall/src/ui/screens/main/main.screen.dart';
import 'package:ecommercesmall/src/ui/screens/methods_payments/methods_payments.screen.dart';
import 'package:ecommercesmall/src/ui/screens/orders/orders.screen.dart';
import 'package:ecommercesmall/src/ui/screens/orders/orders_detail.screen.dart';
import 'package:ecommercesmall/src/ui/screens/personal_information/personal_information.screen.dart';
import 'package:ecommercesmall/src/ui/screens/products/productDetail.screen.dart';
import 'package:ecommercesmall/src/ui/screens/register/register.screen.dart';
import 'package:ecommercesmall/src/ui/screens/settings/settings.screen.dart';
import 'package:ecommercesmall/src/ui/screens/splash/splash.screen.dart';
import 'package:ecommercesmall/src/ui/screens/stores/stores.screen.dart';
import 'package:go_router/go_router.dart';

final goRouterConfig = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        return SplashScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) {
        return RegisterScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.main,
      builder: (context, state) {
        return MainScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.cart,
      builder: (context, state) {
        return CartScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: "${Routes.detailProduct}/:id",
      builder: (context, state) {
        final data = state.pathParameters['id'];
        return ProductDetailScreen(
          key: state.pageKey,
          id: data!,
        );
      },
    ),
    GoRoute(
      path: Routes.checkout,
      builder: (context, state) {
        return CheckoutScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.personalInformation,
      builder: (context, state) {
        return PersonalInformationScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.methodsPayments,
      builder: (context, state) {
        return MethodsPaymentsScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.addresses,
      builder: (context, state) {
        return AddressesScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.personalInformation,
      builder: (context, state) {
        return PersonalInformationScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.orders,
      builder: (context, state) {
        return OrdersScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: "${Routes.orders}/:id",
      builder: (context, state) {
        final data = state.pathParameters['id'];
        return OrdersDetailScreen(
          key: state.pageKey,
          id: data!,
        );
      },
    ),
    GoRoute(
      path: Routes.settings,
      builder: (context, state) {
        return SettingsScreen(
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: "${Routes.stores}/:idCategory",
      builder: (context, state) {
        final data = state.pathParameters['idCategory'];
        return StoresScreen(
          key: state.pageKey,
          idCategory: data ?? '',
        );
      },
    ),
  ],
);
