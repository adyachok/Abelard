import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pegasus/models/horse.dart';
import 'package:pegasus/pages/horse_datails_page.dart';
import 'package:pegasus/providers/selected_horse_provider.dart';
import 'package:pegasus/styles.dart';

class HorseCard extends StatelessWidget {
  final Horse horse;

  const HorseCard({Key? key, required this.horse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
        elevation: 4,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25.0, right: 15, top: 15, bottom: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  horse.imagePath!,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(horse.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 21)),
                        if (horse.hasMessage)
                          const Icon(
                            Icons.email_outlined,
                            color: Color(0xffb71c1c),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Age: ${horse.age}'),
                    const SizedBox(
                      height: 10,
                    ),
                    // Text('Registered: ${horse.systemRegistrationDate}'),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            var selectedHorseProvider =
                                Provider.of<SelectedHorseProvider>(context, listen: false);
                            selectedHorseProvider.setSelected(horse);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HorseDetailsPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'DETAILS',
                            style: linkTextStyle,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
