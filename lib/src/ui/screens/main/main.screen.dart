import 'package:ecommercesmall/src/common/constants/const.dart';
import 'package:ecommercesmall/src/common/utils/flutterToast.util.dart';
import 'package:ecommercesmall/src/config/hiveManager.config.dart';
import 'package:ecommercesmall/src/domain/models/cart.model.dart';
import 'package:ecommercesmall/src/domain/models/product.model.dart';
import 'package:ecommercesmall/src/data/providers/cart.provider.dart';
import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/screens/home/home.screen.dart';
import 'package:ecommercesmall/src/ui/screens/notifications/notifications.screen.dart';
import 'package:ecommercesmall/src/ui/screens/profile/profile.screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Product> products = [
    Product(idProduct: "1", description: "La mejor hamburguesa de la ciudad", name: "Hamburguesa", price: 20.00, image: "image"),
    Product(idProduct: "2", name: "1 Pollo a la brasa", description: "El mejor pollo a la brasa de la ciudad", price: 35.00, image: "image"),
    Product(idProduct: "3", name: "Chaufa", description: "La mejor chaufa de la ciudad", price: 15.00, image: "image"),
    Product(idProduct: "4", name: "Porcion de wantan", description: "La mejor porcion de wantan de la ciudad", price: 8.00, image: "image"),
    Product(idProduct: "5", name: "Lomo saltado", description: "El mejor lomo saltado de la ciudad", price: 40.00, image: "image"),
    Product(idProduct: "6", name: "Monstrito", description: "El mejor monstrito de la ciudad", price: 50.00, image: "image"),
  ];
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  late CartProvider cartProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    // print(json.decode(HiveManager.mainBox!.get(HIVE_KEYS_CART)));
    if (HiveManager.mainBox!.get(HIVE_KEYS_CART) != null) {
      cartProvider.cart = Cart.fromMap(HiveManager.mainBox!.get(HIVE_KEYS_CART));
    }
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: GestureDetector(
              onTap: () {
                if (cartProvider.cart.amount > 0) {
                  context.push(Routes.cart);
                } else {
                  showToastUtil(
                    "El carrito de compras esta vacío",
                  );
                }
              },
              child: badges.Badge(
                badgeContent: Text(
                  cartProvider.cart.amount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                badgeStyle: const badges.BadgeStyle(badgeColor: Colors.black),
                child: const FaIcon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          child: PageView(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            controller: pageController,
            children: const [
              HomeScreen(),
              ProfileScreen(),
              NotificationsScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondaryColor,
        selectedItemColor: white,
        unselectedItemColor: Colors.grey.shade500,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
          pageController.animateToPage(
            currentPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Perfil"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: "Notificaciones"),
        ],
      ),
    );
  }
}
