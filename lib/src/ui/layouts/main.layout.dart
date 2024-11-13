import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  final String? appBarTitle;
  final bool isPadding;
  final Widget? bottomBar;
  const MainLayout({
    super.key,
    required this.body,
    this.appBarTitle,
    this.isPadding = true,
    this.bottomBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: primaryColor,
        title: appBarTitle != null
            ? Text(
                appBarTitle!,
                style: const TextStyle(
                  color: white,
                ),
              )
            : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: isPadding
              ? const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                )
              : EdgeInsets.zero,
          child: body,
        ),
      ),
    );
  }
}
