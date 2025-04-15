import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Color(0xff0d0d0d) : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: powerOn ? Color(0xff0e5250) : Colors.grey[400],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(7),
                    child: Image.asset(
                      iconPath,
                      height: 30,
                      color: powerOn ? Colors.lightBlueAccent : Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.wifi,
                    size: 20,
                    color: powerOn ? Colors.lightBlueAccent : Colors.grey[400],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Memberikan jarak kecil
            // device name
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      smartDeviceName,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color:
                            powerOn ? Colors.lightBlueAccent : Colors.grey[400],
                      ),
                    ),
                    Text(
                      "2 devices",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: powerOn ? Colors.white : Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10), // Memberikan jarak kecil lagi
            // on off
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Biar lebih rapi
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 10),
                  child: Text(
                    powerOn ? "ON" : "OFF",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color:
                          powerOn ? Colors.lightBlueAccent : Colors.grey[400],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: CupertinoSwitch(
                    value: powerOn,
                    onChanged: onChanged,
                    activeTrackColor: Color(0xff0e5250),
                    thumbColor: powerOn ? Colors.lightBlueAccent : Colors.white,
                    inactiveTrackColor: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
