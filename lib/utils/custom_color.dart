class CustomColors {
  //singleton pattern
  static CustomColors? instance;
  CustomColors._();
  static CustomColors getInstance() {
    return instance ??= CustomColors._();
  }
}
