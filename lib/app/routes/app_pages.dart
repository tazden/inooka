import 'package:get/get.dart';

import '../modules/game_screen/bindings/game_screen_binding.dart';
import '../modules/game_screen/views/game_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search_word/bindings/search_word_binding.dart';
import '../modules/search_word/views/search_word_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.GAME_SCREEN,
      page: () => const GameScreenView(),
      binding: GameScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_WORD,
      page: () => const SearchWordView(),
      binding: SearchWordBinding(),
    ),
  ];
}
