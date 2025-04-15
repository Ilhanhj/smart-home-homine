import 'package:flutter/material.dart';

class RoomBox extends StatelessWidget {
  // [roomName, devices, imagePath,  expandedLink]
  final String roomName;
  final String devices;
  final String imagePath;
  final String expandedLink;

  const RoomBox({
    super.key,
    required this.roomName,
    required this.devices,
    required this.imagePath,
    required this.expandedLink,
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
        height: 160,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),

            // Gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                  ),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 8,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "LIVE",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          roomName,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          devices,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            fontSize: 12,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Row(
                      children: [
                        Material(
                          color: const Color(0xff0d0d0d),
                          shape: const CircleBorder(),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              // do something
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.push_pin_outlined,
                                size: 22,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Material(
                          color: const Color(0xff0d0d0d),
                          shape: const CircleBorder(),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              // do something
                              Navigator.pushNamed(context, expandedLink);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.open_in_full_outlined,
                                size: 22,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
