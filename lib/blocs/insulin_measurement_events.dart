// EVENTS
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class InsulinMeasurementEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProcessingInsulinMeasurementEvent extends InsulinMeasurementEvent {}

class SuccessfulInsulinMeasurementEvent extends InsulinMeasurementEvent {}

class FailedInsulinMeasurementEvent extends InsulinMeasurementEvent {}

class ResetInsulinMeasurementEvent extends InsulinMeasurementEvent {}
