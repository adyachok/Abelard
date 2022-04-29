class Horse {
  String name;
  String age;
  String systemRegistrationDate;
  String? imagePath;
  bool hasMessage;

  Horse({
    required this.name,
    required this.age,
    required this.systemRegistrationDate,
    this.imagePath,
    this.hasMessage = false,
  });
}

List<Horse> horses = [
  Horse(
      name: 'Tucker',
      age: '5',
      systemRegistrationDate: '12/12/2021',
      imagePath: 'assets/horse_1.jpeg',
      hasMessage: true),
  Horse(
      name: 'Bella',
      age: '4',
      systemRegistrationDate: '10/07/2021',
      imagePath: 'assets/horse_2.jpeg'),
];
