import 'package:flutter/material.dart';
import 'package:pegasus/models/horse.dart';
import 'package:pegasus/models/useful_information.dart';
import 'package:pegasus/widgets/horse_card.dart';
import 'package:pegasus/widgets/useful_card.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          iconSize: 30,
          backgroundColor: Colors.white.withOpacity(0.4),
          elevation: 4,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.home),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Notifications',
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.ad_units),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              child: Container(
                // color: Colors.green,
                height: size.height * 0.25,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      image: AssetImage('assets/horse.jpeg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Positioned(
              top: size.height * 0.10,
              right: 0,
              left: size.width * 0.5,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(20)),
                child: Container(
                  height: 70,
                  color: Colors.amber[50]?.withOpacity(0.7),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.11,
                    ),
                    child: const Text(
                      'Pegasus',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
            top: size.height * 0.28,
            left: 32.0,
            right: 0,
            child: Container(
              height: size.height * 0.6,
              // color: Colors.teal[50],
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MY HORSES',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    for (var i = 0; i < horses.length; i++)
                      HorseCard(horse: horses[i]),
                    const SizedBox(height: 20),
                    const Text(
                      'USEFUL',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < usefulInformation.length; i++)
                            UsefulCard(
                              usefulInformation: usefulInformation[i],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
