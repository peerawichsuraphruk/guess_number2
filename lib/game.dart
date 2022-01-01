// ignore_for_file: avoid_print

import 'dart:math';

class Game {
  int? _answer;
  int _guessCount = 0;

  Game({maxRandom = 100}) {
    var r = Random();
    _answer = r.nextInt(maxRandom) + 1;
  }

  int get guessCount {
    return _guessCount;
  }

  int doGuess(int num) {
    _guessCount++;
    if (num > _answer!) {
      return 1;
    } else if (num < _answer!) {
      return -1;
    } else {
      return 0;
    }
  }

  List<int> gameRound = [];

  add (int num) {
    gameRound.add(num);
    for (var n = 0; n < gameRound.length; n++) {
      print('Game #${n+1}: ${gameRound[n]} guesses');
    }
  }

  printInfo () {
    print("");
    print("You've played ${gameRound.length} games");
    for (var n in gameRound) {
      print(n);
    }
  }
}

