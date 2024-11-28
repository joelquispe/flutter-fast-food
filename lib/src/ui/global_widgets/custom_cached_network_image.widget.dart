import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomCachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  const CustomCachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.width = 70,
    this.height = 70,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
      width: width,
      height: height,
      placeholder: (context, url) {
        return LoadingAnimationWidget.inkDrop(
          color: Colors.grey,
          size: 20,
        );
      },
      imageBuilder: (context, imageProvider) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return const Icon(Icons.image);
      },
    );
  }
}
