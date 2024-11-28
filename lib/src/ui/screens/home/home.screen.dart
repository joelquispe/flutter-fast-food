import 'package:ecommercesmall/src/ui/providers/cart.provider.dart';
import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/ui/screens/home/widgets/card_category_store.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CartProvider cartProvider;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: GestureDetector(
                  onTap: () {
                    context.push("${Routes.stores}/1");
                  },
                  child: const CardCategoryStoreWidget(
                      title: "Restaurantes",
                      image: "https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=400"),
                ),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: CardCategoryStoreWidget(
                    title: "Farmacias", image: "https://images.pexels.com/photos/5910953/pexels-photo-5910953.jpeg?auto=compress&cs=tinysrgb&w=600"),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: CardCategoryStoreWidget(
                    title: "Tiendas",
                    image: "https://images.pexels.com/photos/1029598/pexels-photo-1029598.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: CardCategoryStoreWidget(
                    title: "Supermercados",
                    image: "https://images.pexels.com/photos/3962285/pexels-photo-3962285.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
