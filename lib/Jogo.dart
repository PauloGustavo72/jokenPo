import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _message = "Escolha uma das opções abaixo:";
  var _imageApp = AssetImage("images/padrao.png");

  play(String optionSelected) {
    var options = ["papel", "pedra", "tesoura"];
    var numberSorted = Random().nextInt(options.length);
    var optionSelectedByComputer = options[numberSorted];
    var messageReturn = "";
    var imagePath = getImagePath(optionSelectedByComputer);

    if (optionSelected == "papel" && optionSelectedByComputer == "pedra" ||
        optionSelected == "pedra" && optionSelectedByComputer == "tesoura" ||
        optionSelected == "tesoura" && optionSelectedByComputer == "papel") {
      messageReturn = "Parabéns, você Ganhou! (:";
    } else if (optionSelected == optionSelectedByComputer) {
      messageReturn = "Empate!";
    } else {
      messageReturn = "Você Perdeu :(";
    }

    setState(() {
      this._imageApp = AssetImage(imagePath);
      this._message = messageReturn;
    });
  }

  getImagePath(String optionSelectedByComputer) {
    switch (optionSelectedByComputer) {
      case "papel":
        return "images/papel.png";
      case "pedra":
        return "images/pedra.png";
      case "tesoura":
        return "images/tesoura.png";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //1) Text
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do app:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //2) imagem
            Image(image: _imageApp),
            //3) Text result
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _message,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //4) Linha 3 imagens
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Image.asset("images/papel.png", height: 95),
                  onTap: () => play("papel"),
                ),
                GestureDetector(
                  child: Image.asset("images/pedra.png", height: 95),
                  onTap: () => play("pedra"),
                ),
                GestureDetector(
                  child: Image.asset("images/tesoura.png", height: 95),
                  onTap: () => play("tesoura"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
