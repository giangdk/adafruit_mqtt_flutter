import 'package:workmanager_example/const.dart';
import 'package:flutter/material.dart';

class ControlButton extends StatefulWidget {
  ControlButton(
      {super.key,
      required this.size,
      required this.icon,
      required this.title,
      this.disapble,
      required this.onTap,
      this.isSelected});

  final Size size;
  final IconData icon;
  final String title;
  final Function onTap;
  final bool? disapble;
  late bool? isSelected;
  @override
  _ControlButtonState createState() => _ControlButtonState();
}

class _ControlButtonState extends State<ControlButton> {
  @override
  Widget build(BuildContext context) {
    //if (widget.disapble == true) widget.isSelected = true;
    return GestureDetector(
      onTap: (() {}),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              widget.onTap.call();
            },
            child: Container(
              height: widget.size.height * 0.105,
              width: widget.size.width * 0.21,
              decoration: BoxDecoration(
                color: (widget.isSelected ?? false == false
                    ? kOrangeColor
                    : Colors.white),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: widget.isSelected ?? false == false
                        ? kOrangeColor.withOpacity(0.5)
                        : Colors.grey.shade200,
                    blurRadius: 30,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Icon(
                widget.icon,
                color: widget.isSelected ?? false == false
                    ? Colors.white
                    : kDarkGreyColor.withOpacity(0.6),
                size: 45,
              ),
            ),
          ),
          SizedBox(height: widget.size.height * 0.005),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kDarkGreyColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
