import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geofence_flutter/geofence_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocatorpolygon/splashScreen.page.dart';
import 'package:geolocatorpolygon/tutorialwidgets.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' as lotti;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevGeocerca',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  late TutorialCoachMark tutorial;
  GoogleMapController? mapController;
  final keytfLatitud = GlobalKey();
  final keytfLongitud = GlobalKey();
  final keyStartGeo = GlobalKey();
  final keyStopGeo = GlobalKey();

  final keyMarcar = GlobalKey();
  List<GlobalKey> keystutorial = [];

  void showTutorial() {
    tutorial = TutorialCoachMark(
        targets: targets,
        colorShadow: Colors.grey,
        textSkip: "Saltar",
        onFinish: () {},
        onClickTarget: (target) {},
        onSkip: () {})
      ..show(context: context);
  }

  @override
  void initState() {
    super.initState();

    // showTutorial();
    // keystutorial = [
    //   keytfLatitud,
    //   keytfLongitud,
    //   keyStartGeo,
    //   keyStopGeo,
    //   keyMarcar
    // ];
    // addTargets(tutorial, keystutorial);

    setState(() {});
  }

  Future<void> checkPermission() async {
    await Geolocator.requestPermission();
  }

  String verifyGeo = "";
  final tfLatitud = TextEditingController();
  final tfLongitud = TextEditingController();
  Set<Marker> markers = {};
 Set<Circle> circles = {};
  @override
  Widget build(BuildContext context) {
    String texto = "";
    StreamController<GeofenceEvent> controller =
        StreamController<GeofenceEvent>();
    StreamSubscription<GeofenceEvent>? geofenceEventStream;
    void startGeofence() async {
      await Geofence.startGeofenceService(
          pointedLatitude: tfLatitud.text,
          pointedLongitude: tfLongitud.text,
          radiusMeter: "100.0",
          eventPeriodInSeconds: 5);
      //  _controller.add(GeofenceEvent.init);
      try {
        // controller.stream.listen((event) {
        //   Geofence.getGeofenceStream()!
        //       .asBroadcastStream()
        //       .listen((GeofenceEvent event) {
        //     setState(() {
        //       verifyGeo = event.name;
        //     });
        //     print(verifyGeo);
        //   });
        // });

        // geofenceEventStream = controller.stream.listen((event) {});
        // Geofence;
        // controller.stream.listen((event) {
        //   print(event.name);

        //   setState(() {
        //     verifyGeo = event.name;
        //   });
        // });

        geofenceEventStream = Geofence.getGeofenceStream()!
            .asBroadcastStream()
            .listen((GeofenceEvent event) {
          setState(() {
            verifyGeo = event.name;
          });
          print(verifyGeo);
        });
        // controller.add(GeofenceEvent.init);
        // geofenceEventStream = controller.stream.listen((event) {
        //   print("controller stream");
        //   print(event);
        // });

        // controller.stream.listen((event) {
        //   print("controller stream");
        //   print(event.name);

        //   setState(() {
        //     verifyGeo = event.name;
        //   });
        // });
      } catch (e) {
        print(e);
      }
      ;
      if (verifyGeo == "") {}
    }

   
    void stopGeofence() async {
      if (geofenceEventStream != null) {}
      geofenceEventStream?.cancel();
      geofenceEventStream = null;
      await Geofence.stopGeofenceService();
    }

    void stopstream() {
      controller.close();
    }

    Future<void> newPosition() async {
      LatLng posi =
          LatLng(double.parse(tfLatitud.text), double.parse(tfLongitud.text));
      mapController!.animateCamera(CameraUpdate.newLatLngZoom(posi, 20.0));

      setState(() {
        Marker marker = Marker(
            markerId: MarkerId("1"),
            position: LatLng(
                double.parse(tfLatitud.text), double.parse(tfLongitud.text)),
            icon: BitmapDescriptor.defaultMarker);
        Circle circle = Circle(
            circleId: CircleId('2'),
            fillColor: Colors.grey.withOpacity(0.4),
            strokeWidth: 5,
            strokeColor: Colors.red,
            center: LatLng(
                double.parse(tfLatitud.text), double.parse(tfLongitud.text)),
            radius: 250);
        markers.add(marker);
        circles.add(circle);
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 300,
                width: 300,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: GoogleMap(
                    onMapCreated: ((controller) {
                      mapController = controller;
                    }),
                    markers: markers,
                    circles: circles,
                    initialCameraPosition: CameraPosition(
                        target:
                            LatLng(-12.084991845707227, -77.0686302403434))),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Latitud",
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder()),
                key: keytfLatitud,
                controller: tfLatitud,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Logitud",
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                key: keytfLongitud,
                controller: tfLongitud,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  key: keyStartGeo,
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 40),
                      backgroundColor: Colors.white24),
                  onPressed: () {
                    if (tfLatitud.text.isEmpty || tfLatitud.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Debe llenar los campos"),
                        behavior: SnackBarBehavior.floating,
                      ));

                      return;
                    }
                    newPosition();
                    startGeofence();
                    tfLatitud.clear();
                    tfLongitud.clear();

                    Fluttertoast.showToast(
                        msg: "Geocerca marcada",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white30,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: Text("Comenzar geocerca")),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         minimumSize: Size(200, 40),
              //         backgroundColor: Colors.white24),
              //     key: keyStopGeo,
              //     onPressed: () {
              //       if (verifyGeo != "") {
              //         stopGeofence();

              //         Fluttertoast.showToast(
              //             msg: "Geocerca eliminada",
              //             toastLength: Toast.LENGTH_SHORT,
              //             gravity: ToastGravity.CENTER,
              //             timeInSecForIosWeb: 1,
              //             backgroundColor: Colors.white30,
              //             textColor: Colors.white,
              //             fontSize: 16.0);
              //         // verifyGeo = "";
              //       } else {
              //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //           content: Text("Debe crear la geocerca"),
              //           behavior: SnackBarBehavior.floating,
              //         ));

              //         return;
              //       }
              //     },
              //     child: Text("Eliminar geocerca")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 40),
                      backgroundColor: Colors.white24),
                  key: keyMarcar,
                  onPressed: () {
                    print(verifyGeo);
                    if (verifyGeo == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Debe crear la geocerca"),
                        behavior: SnackBarBehavior.floating,
                      ));

                      return;
                    } else {
                      if (verifyGeo == "enter") {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor: Colors.white70,
                                title: Center(
                                  child: lotti.Lottie.asset(
                                      "assets/check-out.json",
                                      height: 120),
                                ),
                                content: Text(
                                  "Ha marcado con exito",
                                  textAlign: TextAlign.center,
                                ),
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor: Colors.white70,
                                title: Center(
                                  child: lotti.Lottie.asset("assets/error.json",
                                      height: 120),
                                ),
                                content: Text(
                                  "Debe encontrarse en el establecimiento de trabajo",
                                  textAlign: TextAlign.center,
                                ),
                              );
                            });
                      }
                    }
                  },
                  child: Text("Marcar")),
            ]),
          ),
        ),
      ),
    );
  }
}
