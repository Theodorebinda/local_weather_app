import 'package:get/get.dart';
import 'package:local_weather_app/screens/home/home_screen.dart';

class LocalWeatherRoute {
  static String login = '/login';
  static String homePage = '/homePage';
  static String signUp = '/signUp';

  static String getHomeRoute() => homePage;
  static String getLoginRoute() => login;
  static String getSignUpScreen() => signUp;

  static List<GetPage> routes = [
    //   GetPage(
    //       name: login,
    //       transition: Transition.fadeIn,
    //       transitionDuration: const Duration(milliseconds: 800),
    //       // page: () => const LoginScreen()),
    GetPage(
        name: homePage,
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 800),
        page: () => const HomeScreen()),
    //  , GetPage(
    //       name: signUp,
    //       transition: Transition.fadeIn,
    //       transitionDuration: const Duration(milliseconds: 800),
    //       // page: () => const SignUpPage()),
  ];
}
