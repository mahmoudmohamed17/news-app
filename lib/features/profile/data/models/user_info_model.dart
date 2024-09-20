class UserInfoModel {
  final String name, phone, password, email;

  UserInfoModel(
      {required this.name,
      required this.phone,
      required this.password,
      required this.email});

  factory UserInfoModel.fromStore(store) {
    return UserInfoModel(
        name: store['name'],
        phone: store['phone'],
        password: store['password'],
        email: store['email']);
  }
}
