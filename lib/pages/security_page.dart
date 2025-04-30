import 'package:flutter/material.dart';
import 'package:smart_home/utils/room_box.dart' show RoomBox;
import 'package:smart_home/utils/add_button.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  // [roomName, devices, imagePath,  expandedLink]
  List myRoom = [
    [
      "Living Room",
      "4 devices active",
      "assets/livingroom.webp",
      "/livingroom",
    ],
    ["Kitchen", "3 devices active", "assets/kitchen.webp", "/kitchen"],
    ["Bedroom", "2 devices active", "assets/bedroom.webp", "/bedroom"],
    ["Library", "3 devices active", "assets/library.webp", "/library"],
    ["Garage", "3 devices active", "assets/garage.webp", "/garage"],
    ["Theater", "3 devices active", "assets/theater.webp", "/theater"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Text(
            'S E C U R I T Y ',
            style: TextStyle(
              color: Color(0xff0e5250),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0, // <- Hapus efek bayangan/elevation
        scrolledUnderElevation: 0, // <- Untuk versi Flutter terbaru (3.10+)
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
        child: Column(
          children: [
            AddButton(),
            const SizedBox(height: 10), // jarak bawah tombol
            // Room Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(myRoom.length, (index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // [roomName, devices, imagePath,  expandedLink]
                    child: RoomBox(
                      roomName: myRoom[index][0],
                      devices: myRoom[index][1],
                      imagePath: myRoom[index][2],
                      expandedLink: myRoom[index][3],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
