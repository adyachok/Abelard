import 'package:flutter/material.dart';
import 'package:pegasus/models/horse.dart';

class SelectedHorseProvider extends ChangeNotifier {
  late Horse _selectedHorse;

  Horse get selectedHorse => _selectedHorse;

  void setSelected(Horse horse) {
    _selectedHorse = horse;
    notifyListeners();
  }
}
