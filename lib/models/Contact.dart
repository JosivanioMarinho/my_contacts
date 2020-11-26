class Contact{

  String _contactName;
  String _phoneNumber;
  String _email;

  Contact();

  String get contactName => _contactName;

  set contactName(String contactName){
    _contactName = contactName;
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