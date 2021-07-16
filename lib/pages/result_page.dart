import 'package:flutter/material.dart';
import '/src/constants.dart';
import '/src/custom_widgets.dart';

class ResultPage extends StatelessWidget {
  final String resultado;
  final String resultText;
  final String interpretado;

  ResultPage(
      {required this.resultado,
      required this.resultText,
      required this.interpretado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tu IMC",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Color(0xFFEB1555),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
                child: Center(
                  child: Text("Tu resultado:",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ),
                alignment: Alignment.bottomLeft),
          ),
          Expanded(
              flex: 5,
              child: ContenedorBMI(
                hijo: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(resultado, style: ktextStyleWhite),
                    Text(resultText,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold)),
                    Text(interpretado, style: ktextStyleWhite),
                  ],
                ),
                color: null,
                funcion: null,
              )),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 80,
            child: TextButton(
                child: Text(
                  "RECALCULAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
