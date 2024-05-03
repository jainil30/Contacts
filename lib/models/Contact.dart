/// contactId : 1
/// firstname : "Jainil"
/// lastname : "Dalwadi"
/// mobileNumber : "7048723383"
/// email : "Jainil@fadsf.cas"
/// category : "Office"
/// imagePath : "Jainil/sdfaaf/sdf.jpg"

class Contact {
  Contact({
    num? contactId,
    String? firstname,
    String? lastname,
    String? mobileNumber,
    String? email,
    String? category,
    String? imagePath,
  }) {
    _contactId = contactId;
    _firstname = firstname;
    _lastname = lastname;
    _mobileNumber = mobileNumber;
    _email = email;
    _category = category;
    _imagePath = imagePath;
  }

  Contact.fromJson(dynamic json) {
    _contactId = json['contactId'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _mobileNumber = json['mobileNumber'];
    _email = json['email'];
    _category = json['category'];
    _imagePath = json['imagePath'];
  }
  num? _contactId;
  String? _firstname;
  String? _lastname;
  String? _mobileNumber;
  String? _email;
  String? _category;
  String? _imagePath;
  Contact copyWith({
    num? contactId,
    String? firstname,
    String? lastname,
    String? mobileNumber,
    String? email,
    String? category,
    String? imagePath,
  }) =>
      Contact(
        contactId: contactId ?? _contactId,
        firstname: firstname ?? _firstname,
        lastname: lastname ?? _lastname,
        mobileNumber: mobileNumber ?? _mobileNumber,
        email: email ?? _email,
        category: category ?? _category,
        imagePath: imagePath ?? _imagePath,
      );
  num? get contactId => _contactId;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get mobileNumber => _mobileNumber;
  String? get email => _email;
  String? get category => _category;
  String? get imagePath => _imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['mobileNumber'] = _mobileNumber;
    map['email'] = _email;
    map['category'] = _category;
    map['imagePath'] = _imagePath;
    return map;
  }
}
