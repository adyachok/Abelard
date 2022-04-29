import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pegasus/blocs/insulin_measurement_bloc.dart';
import 'package:pegasus/blocs/insulin_measurement_events.dart';
import 'package:pegasus/widgets/details_tabs/tabs_header.dart';

import '../../styles.dart';
import '../insulin_screen.dart';

class MeasureInsulinTab extends StatefulWidget {
  const MeasureInsulinTab({Key? key}) : super(key: key);

  @override
  State<MeasureInsulinTab> createState() => _MeasureInsulinTabState();
}

class _MeasureInsulinTabState extends State<MeasureInsulinTab> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        // HEADER START
        const HorseDetailsTabHeader(title: 'MEASURE INSULIN'),
        // HEADER END
        Container(
          // color: Colors.black,
          height: size.height * 0.25,
          child: const InsulinScreen(
            top: 0.05,
          ),
        ),
        Container(
          // color: Colors.yellow,
          height: size.height * 0.35,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                  children: [
                    const Text(
                      'SYNCHRONIZE\nON\nSERVER',
                      textAlign: TextAlign.center,
                      style: techTextStyle,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: FloatingActionButton(
                        heroTag: 'upload',
                        tooltip: 'Upload data on the server',
                        onPressed: () {},
                        backgroundColor: Colors.green.withOpacity(0.9),
                        child: const Icon(Icons.upload_rounded),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'MEASURE\nINSULIN',
                      textAlign: TextAlign.center,
                      style: techTextStyle,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: FloatingActionButton(
                        heroTag: 'measure',
                        onPressed: () {
                          var insulinBloc =
                              BlocProvider.of<InsulinMeasurementBloc>(context);
                          insulinBloc.add(ProcessingInsulinMeasurementEvent());
                        },
                        tooltip: 'Measure insulin level',
                        backgroundColor: Colors.blue.withOpacity(0.9),
                        child: const Icon(
                          Icons.sync,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            ],
          ),
        )
      ],
    );
  }
}
