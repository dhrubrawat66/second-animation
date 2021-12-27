import 'package:flutter/material.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  late double iconPosition;
  Alignment iconAlignment = const Alignment(0, 0);
  Alignment iconAlignmentTwo = const Alignment(-1.78, 0);
  Alignment containerAlignment = const Alignment(-5, 0);
  double containerSize = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(65),
        border: Border.all(
          color: Colors.blue,
          width: 4.0,
        ),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onExit: (a) {
          setState(() {
            iconAlignment = const Alignment(0.0, 0.0);
            iconAlignmentTwo = const Alignment(1.78, 0.0);
            containerSize = 0;
          });
        },
        onEnter: (a) {
          setState(() {
            iconAlignment = const Alignment(-1.78, 0.0);
            iconAlignmentTwo = const Alignment(0.0, 0.0);
            containerSize = 1;
          });
        },
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            AnimatedScale(
              scale: containerSize,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: 126,
                height: 126,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
            AnimatedContainer(
              curve: Curves.easeIn,
              alignment: iconAlignment,
              duration: const Duration(milliseconds: 300),
              child: AnimatedOpacity(
                opacity: iconAlignment == const Alignment(-1.78, 0) ? 0 : 1,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  widget.icon,
                  size: 32,
                  color: Colors.blue,
                ),
              ),
            ),
            AnimatedContainer(
              curve: Curves.easeIn,
              alignment: iconAlignmentTwo,
              duration: const Duration(milliseconds: 300),
              child: AnimatedOpacity(
                opacity: iconAlignmentTwo == const Alignment(1.78, 0) ? 0 : 1,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  widget.icon,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
