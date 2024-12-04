class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String password;
  final String phoneno;

  const UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.phoneno,
  });

  toJson(){
    return{
      "Fullname" : fullname,
      "Email": email,
      "Phone Number": phoneno,
      "Password": password
    };
  }
  }