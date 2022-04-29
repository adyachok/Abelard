import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pegasus/providers/selected_horse_provider.dart';

class HorseDetailsTabHeader extends StatelessWidget {
  final Color color;
  final String title;

  const HorseDetailsTabHeader({
    required this.title,
    this.color = Colors.deepPurple,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var selectedHorseProvider =
        Provider.of<SelectedHorseProvider>(context, listen: false);
    final selectedHorse = selectedHorseProvider.selectedHorse;

    return Container(
      height: size.height * 0.16,
      // color: Colors.green,
      child: Stack(
        children: [
          Positioned(
            top: size.height * 0.06,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(right: 20, top: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
                color: color.withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              // color: Colors.yellow,
              height: 40,
              width: size.width * 0.95,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white70),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.01,
            right: size.width * 0.58,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.26),
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(selectedHorse.imagePath ?? 'assets/horse_1.jpeg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  width: 4,
                  color: color.withOpacity(0.6),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              // color: Colors.yellow,
              height: size.width * 0.3,
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: size.height * 0.01,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(right: 20, top: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
                color: color.withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              // color: Colors.yellow,
              height: 30,
              width: size.width * 0.35,
              child: Text(
                selectedHorse.name,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
