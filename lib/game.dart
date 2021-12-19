import 'dart:math';

class Game { // camel case
  static const maxRandom = 100;
  int? answer;
  var guessCount = 0;
  var again = true;

  Game() {
    var r = Random();
    answer = r.nextInt(maxRandom) + 1;
    guessCount = 0;
  }

  int doGuess(int num) {
    guessCount++;
    // ทายถูก return 0
    // ทายมากไป return 1
    // ทายน้อยไป return -1
    if (num > answer!) {
      return 1;
    } else if (num < answer!) {
      return -1;
    } else {
      return 0;
    }
  }

  void newRandom () {
    var r = Random();
    answer = r.nextInt(maxRandom) + 1;
  }

  void resetCount () {
    guessCount = 0;
  }

}
