
import 'dart:io';
import 'dart:math';

enum moves{ Rock, Paper, Scissor}



String PlayerTurn(int round) {
  print("Please choose R(Rock), P(Paper) or S(Scissors). Round:$round");
  var player_move = stdin.readLineSync()!.toUpperCase();
  

  switch (player_move) {
    case "R":
      return "Rock";
     
    case "P":
      return "Paper";
      
    case "S":
      return "Scissor";
      
    default:
      return "Quit";
      
  }
}



String ComputerTurn() {

  Random rand = new Random();
  var element = moves.values[rand.nextInt(moves.values.length)].name;
  return element;
}


void main() {
  var your_score = 0;
  var computer_score = 0;
 var total=1;

  while (true) {
    for (var i = 0; i < 3; i++) {
      

      String player = PlayerTurn(total);
      
      String computer = ComputerTurn();

      if (player == "Quit") {
        return;
      }

      print("You played:$player   Computer played:$computer");

     

      if ((player == "Rock" && computer == "Scissor") ||
          (player == "Scissor" && computer == "Paper") ||
          (player == "Paper" && computer == "Rock")) {
        total++;
        your_score++;
        print("YOUR SCORE: $your_score COMPUTER SCORE: $computer_score");

      } else if (player == computer) {
        total++;
        print("YOUR SCORE: $your_score COMPUTER SCORE: $computer_score");

      } else {
        total++;
        computer_score++;
        print("YOUR SCORE: $your_score COMPUTER SCORE: $computer_score");
      }
      
    }

    if (your_score > computer_score) {
      print(
          "CONGRATULATIONS YOU WON. YOUR SCORE: $your_score COMPUTER SCORE: $computer_score.");
          print("Do you want to play again Y/N.");
          String playAgain = stdin.readLineSync()!.toUpperCase();
          if (playAgain== "Y") {
            return;
          }
          else{
            break;
          }
          
     
    } else if (your_score == computer_score) {
      print("TIE. YOUR SCORE: $your_score COMPUTER SCORE: $computer_score");
      print("Do you want to play again Y/N.");
          String playAgain = stdin.readLineSync()!.toUpperCase();
          if (playAgain== "Y") {
            return main();
          }
          else{
            break;
          }
    } else {
      print(
          "COMPUTER WON. PLAY AGAIN :(. YOUR SCORE: $your_score COMPUTER SCORE: $computer_score ");
      print("Do you want to play again Y/N.");
          String playAgain = stdin.readLineSync()!.toUpperCase();
          if (playAgain== "Y") {
            return main();
          }
          else{
            break;
          }
    }
  }
}
