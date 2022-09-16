import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 0, left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1.2,
          )
        ],
      ),
    );
  }
}
