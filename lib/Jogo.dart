import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    //print("Escolha  do App: " + escolhaApp);
    //print("Escolha do Usuario: " + escolhaUsuario);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = ("Você ganhou!");
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = ("Você perdeu!");
      });
    } else {
      setState(() {
        this._mensagem = ("Empatamos!");
      });
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Escolha do App:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
            Image(
              image: this._imagemApp,
              width: 100,
              height: 125,
            ),
            Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  this._mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: Image.asset("images/pedra.png",
                        width: 100, height: 125)),
                GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset("images/papel.png",
                        width: 100, height: 125)),
                GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: Image.asset("images/tesoura.png",
                        width: 100, height: 125))
              ],
            )
          ],
        ),
      ),
    );
  }
}
