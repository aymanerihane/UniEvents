import './JSON/users.dart';
class UserController {
  static var _user;
  Users get currentUser => _user;

  UserController();

  set currentUser(Users users) {
    print(users.usrType);
    _user = users;
    
  }

}