import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

List<TargetFocus> targets = [];
void addTargets(TutorialCoachMark tutorial, List<GlobalKey> listGlobaKey) {
  targets.add(
    TargetFocus(
        shape: ShapeLightFocus.RRect,
        identify: "Target 1",
        keyTarget: listGlobaKey[0],
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Latitud de la ubicación",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "En google maps al seleccionar un lugar le brinda la latitud.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 40),
                            backgroundColor: Colors.black),
                        onPressed: () {
                          tutorial.next();
                        },
                        child: Text("siguiente"))
                  ],
                ),
              ))
        ]),
  );
  targets.add(
    TargetFocus(
        identify: "Target 1",
        keyTarget: listGlobaKey[1],
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Longitud del lugar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "En google maps al seleccionar un lugar le brinda la longitud.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 40),
                            backgroundColor: Colors.black),
                        onPressed: () {
                          tutorial.next();
                        },
                        child: Text("siguiente"))
                  ],
                ),
              ))
        ]),
  );
  targets.add(
    TargetFocus(
        identify: "Target 1",
        keyTarget: listGlobaKey[2],
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Activar la geocerca",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Dibuja la geocerca donde se podra validad si esta dentro de ella segun la latitud y longitud.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 40),
                            backgroundColor: Colors.black),
                        onPressed: () {
                          tutorial.next();
                        },
                        child: Text("siguiente"))
                  ],
                ),
              ))
        ]),
  );
  targets.add(
    TargetFocus(
        identify: "Target 1",
        keyTarget: listGlobaKey[3],
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Borrar Geocerca",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Es necesario para dibujar otra geocerca.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 40),
                            backgroundColor: Colors.black),
                        onPressed: () {
                          tutorial.next();
                        },
                        child: Text("siguiente"))
                  ],
                ),
              ))
        ]),
  );
  targets.add(
    TargetFocus(
        identify: "Target 1",
        keyTarget: listGlobaKey[4],
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
              align: ContentAlign.top,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Marcar asistencia",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Marcara asistencia si esta dentro de la geocerca caso contrario no podra hasta que este dentro de ella.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 40),
                            backgroundColor: Colors.black),
                        onPressed: () {
                          tutorial.next();
                        },
                        child: Text("siguiente"))
                  ],
                ),
              ))
        ]),
  );
}
