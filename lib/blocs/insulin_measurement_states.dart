// STATES
import 'package:flutter/material.dart';

@immutable
abstract class InsulinMeasurementState {}

class InitialInsulinMeasurementState extends InsulinMeasurementState {}

class ProcessingInsulinMeasurementState extends InsulinMeasurementState {
  final String screenMessage;

  ProcessingInsulinMeasurementState({
    required this.screenMessage,
  });
}

class FailedInsulinMeasurementState extends InsulinMeasurementState {
  final String error;

  FailedInsulinMeasurementState({
    required this.error,
  });
}

class SuccessfulInsulinMeasurementState extends InsulinMeasurementState {
  final double insulinValue;

  SuccessfulInsulinMeasurementState(this.insulinValue);
}
