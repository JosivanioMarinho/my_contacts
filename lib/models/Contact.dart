class Contact{

  String _idUser;
  String _idContact;
  String _name;
  String _phoneNumber;
  String _email;

  Contact();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "name" : this.name,
      "phoneNumber" : this.phoneNumber,
      "email" : this.email
    };

    return map;
  }

  String get idUser => _idUser;

  set idUser(String idUser){
    _idUser = idUser;
  }

  String get idContact => _idContact;

  set idContact(String idContact){
    _idContact = idContact;
  }

  String get name => _name;

  set name(String name){
    _name = name;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String phoneNumber){
    _phoneNumber = phoneNumber;
  }

  String get email => _email;

  set email(String email){
    _email = email;
  }
}