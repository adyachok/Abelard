import 'package:flutter/material.dart';
import 'package:pegasus/styles.dart';
import 'package:pegasus/widgets/details_tabs/events_tab.dart';
import 'package:pegasus/widgets/details_tabs/insulin_trend.dart';
import 'package:pegasus/widgets/details_tabs/measure_insulin.dart';

import '../styles.dart';

class HorseDetailsPage extends StatelessWidget {
  const HorseDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: scaffoldBgColor,
        appBar: AppBar(
          title: const Text('Details'),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('measure'),
              ),
              Tab(
                child: Text('trend'),
              ),
              Tab(
                child: Text('events'),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          MeasureInsulinTab(),
          InsulinTrendTab(),
          EventsTab(),
        ]),
      ),
    );
  }
}
