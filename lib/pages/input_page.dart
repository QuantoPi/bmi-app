import 'package:bmi_app/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/src/custom_widgets.dart';
import '/src/constants.dart';
import '/src/imc.dart';

enum sexo {
  masculino,
  femenino,
  ninguno,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  sexo sexoSeleccionado = sexo.ninguno;
  int estatura = 170;
  int peso = 60;
  int edad = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text('Calculadora BMI',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
            backgroundColor: kcolorActivo),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: ContenedorBMI(
                        funcion: () {
                          setState(() {
                            sexoSeleccionado = sexo.masculino;
                          });
                        },
                        hijo: IconoGenero(
                            texto: "Hombre", icono: FontAwesomeIcons.mars),
                        color: sexoSeleccionado == sexo.masculino
                            ? kcolorActivo
                            : kcolorInactivo),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  child: ContenedorBMI(
                      funcion: () {
                        setState(() {
                          sexoSeleccionado = sexo.femenino;
                        });
                      },
                      hijo: IconoGenero(
                        texto: "Mujer",
                        icono: FontAwesomeIcons.venus,
                      ),
                      color: sexoSeleccionado == sexo.femenino
                          ? kcolorActivo
                          : kcolorInactivo),
                ))
              ],
            )),
            Expanded(
              child: Container(
                child: ContenedorBMI(
                  hijo: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Estatura', style: ktextStyleGrey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textBaseline: TextBaseline.alphabetic,
                        children: [Text('$estatura cm', style: ktextStyleBig)],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 13),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 10),
                        ),
                        child: Slider(
                          value: estatura.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Colors.pink,
                          inactiveColor: Colors.grey,
                          onChanged: (double newHeight) {
                            setState(() {
                              estatura = newHeight.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  color: Colors.white,
                  funcion: null,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ContenedorBMI(
                      hijo: Column(
                        children: [
                          // Botones
                          Text('Peso', style: ktextStyleGrey),
                          Text(peso.toString(), style: ktextStyleBig),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButtom(
                                  icono: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                  funcion: () {
                                    setState(() {
                                      peso--;
                                    });
                                  }),
                              CustomButtom(
                                icono: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                                funcion: () {
                                  setState(() {
                                    peso++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: Colors.white,
                      funcion: null,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: ContenedorBMI(
                          hijo: Column(
                            children: [
                              Text(
                                "Edad",
                                style: ktextStyleGrey,
                              ),
                              Text(edad.toString(), style: ktextStyleBig),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButtom(
                                      funcion: () {
                                        setState(() {
                                          edad--;
                                        });
                                      },
                                      icono: Icon(
                                        FontAwesomeIcons.minus,
                                        color: Colors.white,
                                      ),
                                    ),
                                    CustomButtom(
                                        icono: Icon(
                                          FontAwesomeIcons.plus,
                                          color: Colors.white,
                                        ),
                                        funcion: () {
                                          setState(() {
                                            edad++;
                                          });
                                        }),
                                  ]),
                            ],
                          ),
                          funcion: null,
                          color: Colors.white,
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              height: 80,
              color: Color(0xFFEB1555),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Calc calcular = Calc(peso: peso, estatura: estatura);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                resultado: calcular.calcularBMI(),
                                resultText: calcular.obtenerResultado(),
                                interpretado: calcular.interpretarBMI(),
                              )));
                },
                child: Text("Calcular",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ));
  }
}

class CustomButtom extends StatelessWidget {
  CustomButtom({required this.icono, required this.funcion});
  final icono;
  final funcion;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: funcion,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.expand(
        width: 50,
        height: 40,
      ),
      child: icono,
    );
  }
}

class QuitarAgregar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
