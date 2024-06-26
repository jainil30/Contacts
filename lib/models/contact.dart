import 'package:hive/hive.dart';

/// firstname : "jainil"
/// lastname : "dalwadi"
/// mobilenumber : 1234567890
/// email : "jainil@gmail.com"
/// category : "office"

part 'contact.g.dart';

//Contact Model
@HiveType(typeId: 1)
class Contact {
  Contact(
      {String? firstname,
      String? lastname,
      num? mobilenumber,
      String? email,
      String? category,
      String? imagepath}) {
    _firstname = firstname;
    _lastname = lastname;
    _mobilenumber = mobilenumber;
    _email = email;
    _category = category;
    _imagepath = imagepath;
  }

  Contact.fromJson(dynamic json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _mobilenumber = json['mobilenumber'];
    _email = json['email'];
    _category = json['category'];
  }

  @HiveField(0)
  String? _firstname;

  @HiveField(1)
  String? _lastname;

  @HiveField(2)
  num? _mobilenumber;

  @HiveField(3)
  String? _email;

  @HiveField(4)
  String? _category;

  @HiveField(5)
  String? _imagepath;

  Contact copyWith(
          {String? firstname,
          String? lastname,
          num? mobilenumber,
          String? email,
          String? category,
          String? imagepath}) =>
      Contact(
          firstname: firstname ?? _firstname,
          lastname: lastname ?? _lastname,
          mobilenumber: mobilenumber ?? _mobilenumber,
          email: email ?? _email,
          category: category ?? _category,
          imagepath: imagepath ?? _imagepath);
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  num? get mobilenumber => _mobilenumber;
  String? get email => _email;
  String? get category => _category;
  String? get imagepath => _imagepath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['mobilenumber'] = _mobilenumber;
    map['email'] = _email;
    map['category'] = _category;
    map['imagepath'] = _imagepath;
    return map;
  }
}
