import 'package:get/get.dart';
import 'package:app_scanner_qrcode/screens/home_screen.dart';

class RouteController {
  static String home = '/home';

  static String getHomeRoute() => home;

  static List<GetPage> routes = [
    GetPage(
      page: () => const HomeScreen(),
      name: home,
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
