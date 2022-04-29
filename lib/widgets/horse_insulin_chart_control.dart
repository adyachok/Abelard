import 'package:flutter/material.dart';

class HorseInsulinChartControl extends StatelessWidget {
  final double top;
  const HorseInsulinChartControl({Key? key, this.top = 0.4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: size.height * top,
          left: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(80),
            ),
            child: Container(
              width: size.width * 0.95,
              height: size.height * 0.5,
              color: Colors.blueGrey.withOpacity(0.4),
            ),
          ),
        ),
        Positioned(
          top: size.height * (top + 0.05),
          left: size.width * 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(50),
            ),
            child: Container(
              height: size.height * 0.33,
              width: size.width * 0.84,
              color: Colors.yellowAccent.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          top: size.height * (top + 0.4),
          left: size.width * 0.56,
          child: SizedBox(
            height: 140,
            width: 140,
            child: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Measure insulin level',
              backgroundColor: Colors.blue.withOpacity(0.9),
              child: const Icon(
                Icons.sync,
                size: 50,
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * (top + 0.45),
          left: size.width * 0.25,
          child: SizedBox(
            height: 80,
            width: 80,
            child: FloatingActionButton(
              tooltip: 'Upload data on the server',
              onPressed: () {},
              backgroundColor: Colors.green.withOpacity(0.9),
              child: const Icon(Icons.upload_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
