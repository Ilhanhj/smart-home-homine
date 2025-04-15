import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 25, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff0d0d0d),
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.add,
              size: 24,
              color: Colors.lightBlueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
