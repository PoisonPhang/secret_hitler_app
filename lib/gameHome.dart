import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secret_hitler_app/models/game.dart';
import 'package:secret_hitler_app/models/player.dart';

class PlayerData extends StatefulWidget {
  PlayerData({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayerDataState createState() => _PlayerDataState();
}

Future<void> showFaction(Player player, context) async {
  String faction = player.faction.toString().split('.')[1];
  String message = player.isHitler ? 'You\'re Hitler!' : 'You\'re a $faction';

  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hide this!'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Neat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}

class _PlayerDataState extends State<PlayerData> {
  final _player = Player();

  @override
  Widget build(BuildContext context) {
    final Game _gameData = ModalRoute.of(context).settings.arguments;
    final String _username = _gameData.player.username;

    _player.username = _gameData.player.username;
    _player.faction = _gameData.player.faction;
    _player.isHitler = _gameData.player.isHitler;
    _player.isDead = _gameData.player.isDead;

    return Scaffold(
      appBar: AppBar(
        title: Text('$_username'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  showFaction(_player, context);
                },
                color: Colors.yellow,
                splashColor: Colors.redAccent,
                child: Text('Reveal Faction'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
