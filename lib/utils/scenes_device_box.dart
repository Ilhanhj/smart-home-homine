import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScenesDeviceBox extends StatelessWidget {
  // [sceneName, powerStatus, devices, triggerTime (HH:mm), actionDescription]

  final String scenesDeviceName;
  final bool powerOn;
  final int devices;
  final String triggers;
  final String action;
  void Function(bool)? onChanged;

  ScenesDeviceBox({
    super.key,
    required this.scenesDeviceName,
    required this.powerOn,
    required this.devices,
    required this.triggers,
    required this.action,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        25,
        0,
        25,
        0,
      ), // Sesuaikan padding sesuai kebutuhan(0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Color(0xff0d0d0d) : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SCENE NAME
                          Text(
                            scenesDeviceName,
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:
                                  powerOn
                                      ? Colors.lightBlueAccent
                                      : Colors.grey[400],
                            ),
                          ),

                          // DEVICES INFO
                          Text(
                            "$devices devices",
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall?.copyWith(
                              fontSize: 12,
                              color: powerOn ? Colors.white : Colors.grey[400],
                            ),
                          ),

                          const SizedBox(height: 8),

                          // TRIGGER & ACTION DESCRIPTION
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 16,
                                color:
                                    powerOn ? Colors.white : Colors.grey[400],
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Triggers at ",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(
                                  fontSize: 12,
                                  color:
                                      powerOn ? Colors.white : Colors.grey[400],
                                ),
                              ),
                              Text(
                                triggers,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      powerOn
                                          ? Colors.lightBlueAccent
                                          : Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.bolt,
                                size: 16,
                                color:
                                    powerOn ? Colors.white : Colors.grey[400],
                              ),
                              const SizedBox(width: 5),
                              Text(
                                action,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  color:
                                      powerOn ? Colors.white : Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Biar lebih rapi
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: CupertinoSwitch(
                          value: powerOn,
                          onChanged: onChanged,
                          activeTrackColor: Color(0xff0e5250),
                          thumbColor:
                              powerOn ? Colors.lightBlueAccent : Colors.white,
                          inactiveTrackColor: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
