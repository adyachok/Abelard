import 'package:flutter/material.dart';

import 'package:pegasus/models/useful_information.dart';
import 'package:pegasus/styles.dart';

class UsefulCard extends StatelessWidget {
  final UsefulInformation usefulInformation;

  const UsefulCard({
    Key? key,
    required this.usefulInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 180,
      margin: const EdgeInsets.only(right: 10, bottom: 10, top: 5),
      child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                  flex: 3,
                  fit: FlexFit.loose,
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      usefulInformation.imagePath,
                      fit: BoxFit.cover,
                      width: 180,
                    ),
                  )),
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
                  child: Text(
                    usefulInformation.title,
                    style: usefulInformationTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 5.0,
                  ),
                  child: Text(
                    usefulInformation.text,
                    maxLines: 2,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {},
                    child: const Text('MORE', style: linkTextStyle)),
              )
            ],
          )),
    );
  }
}
