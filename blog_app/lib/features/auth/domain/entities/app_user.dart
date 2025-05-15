class AppUser {
  final String uId;
  final String email;
  final String name;

  AppUser({
    required this.uId, 
    required this.email, 
    required this.name
  });

  //convert app user -> json
  Map<String, dynamic> toJson() {
    return {
      'uId': uId, 
      'email': email, 
      'name': name
    };
  }

  //convert json -> app user
  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(
      uId: jsonUser['uId'], 
      email: jsonUser['email'], 
      name: jsonUser['name']
    );
  }
}
