// ignore_for_file: avoid_print

import 'dart:io';
import 'game.dart';

void main() {
  const maxRandom = 10;
  var game = Game();
  var isCorrect = false;
  var again = true;
  var pass = false;

  do {
    if (again) {
      isCorrect = false; // reset answer
      print('╔════════════════════════════════════════');
      print('║            GUESS THE NUMBER            ');
      print('╟────────────────────────────────────────');

      do {
        stdout.write('║ Guess the number between 1 and $maxRandom: ');
        var input = stdin.readLineSync();
        var guess = int.tryParse(input!);
        if (guess == null) {
          continue;
        }

        var result = game.doGuess(guess);
        var count = game.guessCount;

        if (result == 1) {
          print('║ ➜ $guess is TOO HIGH! ▲');
          print('╟────────────────────────────────────────');
        } else if (result == -1) {
          print('║ ➜ $guess is TOO LOW! ▼');
          print('╟────────────────────────────────────────');
        } else if (result == 0) {
          print('║ ➜ $guess is CORRECT ❤, total guesses: $count');
          print('╟────────────────────────────────────────');
          print('║                 THE END                ');
          print('╚════════════════════════════════════════');
          isCorrect = true;
          count = 0;
        }
      } while (!isCorrect);
    }

    do {
      stdout.write('Play again? (Y/N): ');
      var user = stdin.readLineSync();

      if (user == "Y" || user == "y") {
        game.newRandom();
        game.resetCount();
        again = true;
        pass = true;
      } else if (user == "N" || user == "n") {
        again = false;
        pass = true;
      } else {
        pass = false;
        continue;
      }
    } while (!pass);
  } while (again);
}
