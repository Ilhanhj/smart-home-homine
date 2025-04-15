import 'package:flutter/material.dart';
import 'package:smart_home/utils/scenes_device_box.dart';
import 'package:smart_home/utils/add_button.dart';

class ScenesPage extends StatefulWidget {
  const ScenesPage({super.key});

  @override
  State<ScenesPage> createState() => _ScenesPageState();
}

class _ScenesPageState extends State<ScenesPage> {
  // [sceneName, powerStatus, devices, triggerTime (HH:mm), actionDescription]
  List myScenes = [
    ["Good Morning", true, 4, "05:00 AM", "Turn on Smart Lamp in Bedroom"],
    ["Movie Time", true, 2, "08:00 PM", "Turn on Smart TV"],
    ["Bedtime", true, 2, "10:00 PM", "Lock Smart Door"],
    ["Romantic Night", false, 3, "09:00 PM", "Play Soft Music on Smart Sound"],
    ["Focus Mode", true, 2, "01:00 PM", "Turn on Smart Lamp in Living Room"],
    ["Party Mode", false, 5, "07:00 PM", "Play Party Playlist on Smart Sound"],
    ["Chill Vibes", false, 3, "04:20 PM", "Play Lo-Fi on Smart Sound"],
    ["Workout Time", true, 2, "06:00 AM", "Set Smart AC to 22°C"],
    ["Power Nap", false, 1, "03:00 PM", " Activate Smart Robot to Clean"],
    ["Family Dinner", true, 3, "07:30 PM", "Turn on Dining Room Smart Lamp"],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      myScenes[index][1] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Text(
            'S C E N E S',
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
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(myScenes.length, (index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ScenesDeviceBox(
                    scenesDeviceName: myScenes[index][0],
                    powerOn: myScenes[index][1],
                    devices: myScenes[index][2],
                    triggers: myScenes[index][3],
                    action: myScenes[index][4],
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
