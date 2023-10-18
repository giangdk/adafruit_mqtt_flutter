import 'package:workmanager_example/const.dart';
import 'package:flutter/material.dart';

class StatusButton2 extends StatelessWidget {
  StatusButton2({super.key, required this.size, this.isActive});
  final bool? isActive;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.16,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 0,
            offset: Offset(-3, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.rss_feed,
                  size: 55,
                  color: isActive == true ? kOrangeColor : Colors.grey.shade400,
                ),
                //StatusButton(size: size, key: null,),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Text(
              'SENSORS',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            Text(
              isActive == true ? 'ON' : "OFF",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.lightGreen),
            ),
          ],
        ),
      ),
    );
  }
}
