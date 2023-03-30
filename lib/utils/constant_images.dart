class ConstantImages {
  //singleton pattern
  static ConstantImages? instance;
  ConstantImages._();
  static ConstantImages getInstance() {
    return instance ??= ConstantImages._();
  }

  String get profilePictureHint =>
      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";
}
