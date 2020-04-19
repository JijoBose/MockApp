class User {
  int id;
  String name;
  String username;
  String email;
  var address;

  User(int id, String name, String username, String email, var address) {
    this.id = id;
    this.name = name;
    this.username = username;
    this.email = email;
    this.address = {
      'street': address.street,
      'suite': address.suite,
      'city': address.city,
      'zipcode': address.zipcode,
      'geo': {
        'lat': address.geo.lat,
        'lng': address.geo.lng,
      }
    };
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        address = json['address'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address
    };
  }
}
