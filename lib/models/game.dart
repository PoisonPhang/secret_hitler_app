import 'package:secret_hitler_app/models/player.dart';

class Game {
  String gameCode = '';
  Player player = Player();
  List players = new List<Player>();
  List liberalPolicies = new List<bool>(6);
  List facistPolicies = new List<bool>(6);
}
