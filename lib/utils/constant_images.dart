class ConstantImages {
  //singleton pattern
  static ConstantImages? _instance;
  ConstantImages._();
  static ConstantImages getInstance() {
    return _instance ??= ConstantImages._();
  }

  String get profilePictureHint =>
      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";

  String get homePageBackgroundImage =>
      "https://imgyukle.com/f/2023/03/30/Qzakus.png";
}
