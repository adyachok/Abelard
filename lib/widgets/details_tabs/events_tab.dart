import 'package:flutter/material.dart';
import 'package:pegasus/widgets/details_tabs/tabs_header.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HorseDetailsTabHeader(
          color: Colors.teal,
          title: 'EVENTS',
        ),
      ],
    );
  }
}
