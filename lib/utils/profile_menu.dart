import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String itemName;
  final IconData iconData;
  final VoidCallback? onTap; // Lebih tepat daripada Function?

  const ProfileMenu({
    super.key,
    required this.itemName,
    required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
      child: Material(
        color: Color(0xff0d0d0d),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(iconData, color: Colors.lightBlueAccent, size: 26),
                const SizedBox(width: 16),
                Text(
                  itemName,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
