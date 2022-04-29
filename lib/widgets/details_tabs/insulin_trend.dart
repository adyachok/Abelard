import 'package:flutter/material.dart';
import 'package:pegasus/widgets/details_tabs/tabs_header.dart';

class InsulinTrendTab extends StatelessWidget {
  const InsulinTrendTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HorseDetailsTabHeader(
          color: Colors.orange,
          title: 'INSULIN TREND',
        ),
      ],
    );
  }
}
