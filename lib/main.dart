import 'package:fish_tank/db_fish/db_fish.dart';
import 'package:fish_tank/pages/fish_add/fish_add_binding.dart';
import 'package:fish_tank/pages/fish_add/fish_add_view.dart';
import 'package:fish_tank/pages/fish_first/fish_first_binding.dart';
import 'package:fish_tank/pages/fish_first/fish_first_view.dart';
import 'package:fish_tank/pages/fish_second/fish_second_binding.dart';
import 'package:fish_tank/pages/fish_second/fish_second_view.dart';
import 'package:fish_tank/pages/fish_tab/fish_tab_binding.dart';
import 'package:fish_tank/pages/fish_tab/fish_tab_view.dart';
import 'package:fish_tank/pages/fish_tank_add/fish_tank_add_binding.dart';
import 'package:fish_tank/pages/fish_tank_add/fish_tank_add_view.dart';
import 'package:fish_tank/pages/fish_tank_details/fish_tank_details_binding.dart';
import 'package:fish_tank/pages/fish_tank_details/fish_tank_details_view.dart';
import 'package:fish_tank/pages/no_network/no_network_binding.dart';
import 'package:fish_tank/pages/no_network/no_network_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.white;

List<String> typeTitles = ['Tropical zone','Fresh water'];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Get.putAsync(() => DBFish().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Thats,
      initialRoute: '/fish_tab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme:const BottomNavigationBarThemeData(
          unselectedItemColor: Colors.white,
          unselectedLabelStyle:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          selectedItemColor: Colors.white,
          selectedLabelStyle:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Thats = [
  GetPage(name: '/fish_error', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
  GetPage(name: '/fish_add', page: () => FishAddPage(), binding: FishAddBinding()),
  GetPage(name: '/fish_first', page: () => FishFirstPage(), binding: FishFirstBinding()),
  GetPage(name: '/fish_second', page: () => FishSecondPage(), binding: FishSecondBinding()),
  GetPage(name: '/fish_tab', page: () => FishTabPage(), binding: FishTabBinding()),
  GetPage(name: '/fish_tank_add', page: () => FishTankAddPage(), binding: FishTankAddBinding()),
  GetPage(name: '/fish_tank_details', page: () => FishTankDetailsPage(), binding: FishTankDetailsBinding()),
];