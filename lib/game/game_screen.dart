import 'package:flutter/material.dart';
import 'package:game_client/game/map.dart';
import 'package:game_client/game/path.dart';
import 'package:game_client/game/player.dart';
import 'package:game_client/wallet/wallet_connector.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  int player = numberInRow * 15 + 1;
  String direction = "right";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                child: GridView.builder(
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberInRow,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (player == index) {
                      return Player();
                    } else if (barriers.contains(index)) {
                      return Path(
                        innerColor: Colors.blue[800],
                        outerColor: Colors.blue[900],
                        child: Text(index.toString()),
                      );
                    } else {
                      return Path(
                        innerColor: Colors.grey[800],
                        outerColor: Colors.grey[900],
                        child: Text(index.toString()),
                      );
                    }
                  },
                ),
              )),
          Expanded(
              child: Container(
            child: Row(
              children: [
                Text("PLAY"),
                ElevatedButton(
                  onPressed: () {
                    WalletConnector.launchURL();
                  },
                  child: Text("View Profile"),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}