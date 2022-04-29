import 'dart:async';

import 'package:bloc/bloc.dart';
import 'insulin_measurement_events.dart';
import 'insulin_measurement_states.dart';

// Bloc
class InsulinMeasurementBloc
    extends Bloc<InsulinMeasurementEvent, InsulinMeasurementState> {
  InsulinMeasurementBloc(InsulinMeasurementState initialState)
      : super(initialState) {
    on<ProcessingInsulinMeasurementEvent>((event, emit) async {
      emit(ProcessingInsulinMeasurementState(screenMessage: 'please wait...'));
      // THIS CODE MOCKS MEASURMENT PROCESS
      await Future.delayed(const Duration(seconds: 13));
      emit(SuccessfulInsulinMeasurementState(10.01));
      // END MOCK
    });

    on<SuccessfulInsulinMeasurementEvent>(
        (event, emit) => emit(SuccessfulInsulinMeasurementState(10.01)));

    on<FailedInsulinMeasurementEvent>((event, emit) => emit(
        FailedInsulinMeasurementState(
            error: 'Error measuring Insuline value')));

    on<ResetInsulinMeasurementEvent>(
        (event, emit) => InitialInsulinMeasurementState());
  }
}
