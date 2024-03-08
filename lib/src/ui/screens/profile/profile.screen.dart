import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_listTile.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemListTileProfile> items = [
      ItemListTileProfile(
        label: "Información personal",
        icon: Icons.person,
        path: Routes.personalInformation,
      ),
      ItemListTileProfile(
        label: "Métodos de pagos",
        icon: Icons.payment,
        path: Routes.methodsPayments,
      ),
      ItemListTileProfile(
        label: "Mis direcciones",
        icon: Icons.place,
        path: Routes.addresses,
      ),
      ItemListTileProfile(
        label: "Mis pedidos",
        icon: Icons.gif_box,
        path: Routes.orders,
      ),
      ItemListTileProfile(
        label: "Configuración",
        icon: Icons.settings,
        path: Routes.settings,
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.network(
            "https://static.vecteezy.com/system/resources/thumbnails/001/234/725/small/side-portrait-of-a-black-man.jpg",
            width: 100,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (context, index) {
            return Container(
              color: Colors.grey.shade300,
              height: 1,
            );
          },
          itemBuilder: (context, index) {
            ItemListTileProfile item = items[index];
            return CustomListTileWidget(
                leadingIcon: item.icon,
                title: item.label,
                onTap: () {
                  context.push(item.path);
                });
          },
        ),
        const Spacer(),
        CustomButtonWidget(
          text: "Cerrar sesión",
          onTap: () {},
        )
      ],
    );
  }
}

class ItemListTileProfile {
  final String label;
  final IconData icon;
  final String path;

  ItemListTileProfile({
    required this.label,
    required this.icon,
    required this.path,
  });
}
