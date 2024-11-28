import 'package:ecommercesmall/src/config/hiveManager.config.dart';
import 'package:ecommercesmall/src/themes/themes.dart';
import 'package:ecommercesmall/src/ui/providers/cart.provider.dart';
import 'package:ecommercesmall/src/ui/providers/product.provider.dart';
import 'package:ecommercesmall/src/router/router.dart';
import 'package:ecommercesmall/src/ui/providers/card_information_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    HiveManager.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
         ChangeNotifierProvider<CardInformationProvider>(
          create: (_) => CardInformationProvider(),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp.router(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('es'),
            ],
            theme: themeLight(context),
            darkTheme: themeDark(context),
            debugShowCheckedModeBanner: false,
            title: 'Fast Food',
            routerConfig: goRouterConfig,
          );
        },
      ),
    );
  }
}
