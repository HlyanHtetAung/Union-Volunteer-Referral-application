class Patient {
  Patient({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String phone;
  late final String email;

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['phone'] = phone;
    _data['email'] = email;
    return _data;
  }
}
