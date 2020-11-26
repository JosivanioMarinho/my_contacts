class User{

  String _name;
  String _email;
  String _password;

  User();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "name" : this.name,
      "email" : this.email
    };

    return map;
  }

  String get name => _name;

  set name(String name){
    _name = name;
  }

  String get email => _email;

  set email(String email){
    _email = email;
  }

  String get password => _password;

  set password(String password){
    _password = password;
  }
}