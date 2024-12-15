import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercesmall/src/common/constants/data.dart';
import 'package:ecommercesmall/src/core/models/stores.model.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:ecommercesmall/src/ui/screens/products/products.screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoresScreen extends StatefulWidget {
  final String idCategory;
  const StoresScreen({
    super.key,
    required this.idCategory,
  });

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.idCategory);
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: "Restaurantes",
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: stores.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        separatorBuilder: (context, index) {
          return Container(
            color: Colors.grey.shade200,
            margin: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            height: 1,
          );
        },
        itemBuilder: (context, index) {
          StoreModel store = stores[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen()));
            },
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              "https://img.freepik.com/fotos-premium/mini-tienda-3d-render-banner-concepto-compras-linea-fondo-colorido_175994-83806.jpg?w=1380",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          alignment: Alignment.topCenter,
                          filterQuality: FilterQuality.medium,
                          height: 140,
                          placeholder: (context, url) {
                            return LoadingAnimationWidget.inkDrop(
                              color: Colors.grey,
                              size: 20,
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const Icon(Icons.image);
                          },
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 120,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Miin Store",
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Precios bajos siempre",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "30-50 min - Envío S/4.99",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Delivery del local",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.heart,
                                          size: 15,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 15,
                      top: 95,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://img.freepik.com/vector-gratis/vector-diseno-logotipo-tienda-bicicletas_53876-40626.jpg?t=st=1709884342~exp=1709887942~hmac=2e49357a6ef21f19c2af8d55db9019b8ebd9de662ad1a1dc2f22a770f83e5dd9&w=826",
                        fit: BoxFit.cover,
                        width: 100,
                        alignment: Alignment.topCenter,
                        filterQuality: FilterQuality.medium,
                        height: 100,
                        imageBuilder: (context, imageProvider) {
                          return Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(200),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: imageProvider),
                              ),
                            ),
                          );
                        },
                        placeholder: (context, url) {
                          return LoadingAnimationWidget.inkDrop(
                            color: Colors.grey,
                            size: 20,
                          );
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.image);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
