import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_weather_app/constant/colors.dart';
import 'package:local_weather_app/routes/apps_router.dart';
import 'package:local_weather_app/widgets/localizatio_user.dart';
import 'package:provider/provider.dart';

void main() async {
  if (kDebugMode) {
    await dotenv.load(
      fileName: "dev.env",
    );
  } else {
    await dotenv.load(
      fileName: "prod.env",
    );
  }

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Enregistrer le ColorController dans GetX
  // Get.put(ColorController());

  runApp(
    // MultiProvider(
    // providers: [
    //   // ChangeNotifierProvider(create: (_) => FormRecapProvider()),
    //   // ChangeNotifierProvider(create: (_) => PersonProvider()),
    // ],
    // child:
    const MyApp(),
    // )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'local_weather_app',
      initialRoute: LocalWeatherRoute.getHomeRoute(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr'),
        Locale('en'),
      ],
      theme: ThemeData(
        primaryColor: LocalWeatherColors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
      ),
      getPages: LocalWeatherRoute.routes,
    );
  }
}
