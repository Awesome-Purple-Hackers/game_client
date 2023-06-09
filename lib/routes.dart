import 'package:game_client/game/game_screen.dart';
import 'package:game_client/home_screen.dart';
import 'package:game_client/quiz/quiz_screen.dart';
import 'package:game_client/reward/result_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String initial = '/home';
  static const String game = '/game';
  static const String quiz = '/quiz';
  static const String result = '/result';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomeScreen()),
    GetPage(name: game, page: () => GameScreen()),
    GetPage(name: quiz, page: () => QuizScreen()),
    GetPage(name: result, page: () => ResultScreen()),
  ];
}
