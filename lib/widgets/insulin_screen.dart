import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'package:pegasus/blocs/insulin_measurement_bloc.dart';
import 'package:pegasus/blocs/insulin_measurement_states.dart';

import '../styles.dart';

class InsulinScreen extends StatefulWidget {
  final double top;

  const InsulinScreen({Key? key, this.top = 0.1}) : super(key: key);

  @override
  State<InsulinScreen> createState() => _InsulinScreenState();
}

class _InsulinScreenState extends State<InsulinScreen> {
  @override
  Widget build(BuildContext context) {
    var top = widget.top;
    var size = MediaQuery.of(context).size;
    return BlocBuilder<InsulinMeasurementBloc, InsulinMeasurementState>(
      builder: (context, state) {
        return Stack(
          children: [
            // Insulin screen
            Positioned(
              top: size.height * top,
              left: size.width * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.86,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: size.height * top,
              left: size.width * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.86,
                  color: Colors.yellowAccent.withOpacity(0.5),
                ),
              ),
            ),

            Positioned(
              top: size.height * top,
              left: size.width * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.86,
                    child: getOutputValue(state),
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, -3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            getIndicator(state, size),
            // END Insulin screen
          ],
        );
      },
    );
  }

  Widget getOutputValue(InsulinMeasurementState state) {
    if (state is InitialInsulinMeasurementState) {
      return _buildText('0');
    } else if (state is ProcessingInsulinMeasurementState) {
      return _buildComplexMarquee(state.screenMessage);
    } else if (state is FailedInsulinMeasurementState) {
      return _buildComplexMarquee(state.error);
    } else if (state is SuccessfulInsulinMeasurementState) {
      return _buildText(state.insulinValue.toString());
    } else {
      return _buildText('0');
    }
  }

  Widget getIndicator(InsulinMeasurementState state, Size size) {
    if (state is SuccessfulInsulinMeasurementState) {
      if (state.insulinValue < 20) {
        return _buildIndicator(size, 'norm', Colors.green[900]);
      } else {
        return _buildIndicator(size, 'warn', Colors.red[900]);
      }
    }
    return _buildIndicator(size, '', Colors.transparent);
  }

  Widget _buildIndicator(Size size, String text, Color? color) {
    return Positioned(
      top: size.height * widget.top * 1.35,
      left: size.width * 0.07 * 2,
      child: Text(
        text,
        style: TextStyle(
            color: color, fontWeight: FontWeight.w900, fontFamily: 'Digital7'),
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: Text(
        text,
        style: insulinScreenTextStyle,
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _buildComplexMarquee(String text) {
    return Marquee(
      key: const Key("insulinScreen"),
      text: text,
      style: insulinScreenTextStyle,
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 100.0,
      velocity: 100.0,
      pauseAfterRound: const Duration(milliseconds: 700),
      showFadingOnlyWhenScrolling: true,
      fadingEdgeStartFraction: 0.1,
      fadingEdgeEndFraction: 0.1,
      numberOfRounds: 3,
      startPadding: 10.0,
      accelerationDuration: const Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: const Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
      textDirection: TextDirection.ltr,
    );
  }
}
