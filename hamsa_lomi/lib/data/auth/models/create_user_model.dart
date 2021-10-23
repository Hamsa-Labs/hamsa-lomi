// Project imports:
import '../../../domain/auth/entities/create_user.dart';

class CreateUserModel extends CreateUser {
  CreateUserModel(
      {required String username,
      required String email,
      required String password})
      : super(username: username, email: email, password: password);
}
