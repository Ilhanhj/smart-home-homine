import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  final String roomName;
  final String imagePath;

  const CameraPage({
    super.key,
    required this.roomName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // biar gambar full sampai atas
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          roomName.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.crisis_alert),
                color: Colors.red,
                iconSize: 30,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),

          // Dark overlay biar teks & icon keliatan
          Container(color: Colors.black.withOpacity(0.2)),

          // Control buttons
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/icons/left-controller.png'),
                const SizedBox(width: 25),
                Image.asset('lib/icons/middle-controller.png'),
                const SizedBox(width: 25),
                Image.asset('lib/icons/right-controller.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
