import 'package:flutter/material.dart';
import 'package:smart_home/utils/smart_device_box.dart';
import 'package:smart_home/utils/room_stat.dart';
import 'package:smart_home/utils/custom_appbar.dart';

class SmartHomePage extends StatefulWidget {
  const SmartHomePage({super.key});

  @override
  State<SmartHomePage> createState() => _SmartHomePageState();
}

class _SmartHomePageState extends State<SmartHomePage> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [smartDeviceName, iconPath, powerStatus]
    ["Smart Light", "lib/icons/light.png", true],
    ["Smart AC", "lib/icons/ac.png", true],
    ["Smart TV", "lib/icons/tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", true],
    ["Smart Sound", "lib/icons/speaker.png", false],
    ["Smart Robot", "lib/icons/robot.png", true],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 90),
          children: [
            // App Bar (Hi, Han)
            CustomAppBar(),

            const SizedBox(height: 20),

            // Room Stat
            RoomStat(),

            const SizedBox(height: 20),

            // Section title
            Text(
              "Smart Devices",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Smart Devices Grid
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(mySmartDevices.length, (index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  child: SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
