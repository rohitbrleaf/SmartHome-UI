import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'grid_view_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List deviceLength = [
    ["Smart Light", "images/light-bulb.png", true],
    ["Smart AC", "images/air-conditioner.png", false],
    ["Smart TV", "images/smart-tv.png", false],
    ["Smart Fan", "images/fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      deviceLength[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 25.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "images/menu.png",
                      height: 40.0,
                      color: Colors.grey[800],
                    ),
                    Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.grey[800],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("welcome"),
                    Text(
                      "Rohit BR",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 72.0,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: Colors.grey.shade400,
                  thickness: 1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: Text(
                  "Smart Devices",
                  style: TextStyle(
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Expanded(
                  child: GridView.builder(
                itemCount: deviceLength.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridWidgetsList(
                      smartDeviceName: deviceLength[index][0],
                      iconPath: deviceLength[index][1],
                      powerOn: deviceLength[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
