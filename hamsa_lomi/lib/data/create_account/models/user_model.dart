// Project imports:
import '../../../domain/create_account/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required String username,
      required String email,
      required String password})
      : super(username: username, email: email, password: password);
}
