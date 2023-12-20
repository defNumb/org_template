import 'dart:math';

import 'package:hive/hive.dart';
import 'package:org_template/models/custom_error.dart';

import '../models/user.dart';

class AuthenticationService {
  // box
  late Box<User> _userBox;

  // init method to initialize and retrieve database from hive
  Future<void> init() async {
    // check if adapter has already been registered, if so skip
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserAdapter());
    }
    _userBox = await Hive.openBox<User>('usersBox');

    // add admin user for testing purposes only
    final admin = User(
      id: Random().nextInt(1000).toString(),
      name: 'admin',
      email: 'test@mail.com',
      password: 'admin',
      role: 'admin',
    );
    await _userBox.add(admin);
  }

  Future<String?> login(final String username, final String password) async {
    final success = _userBox.values
        .any((user) => user.email == username && user.password == password);
    if (success) {
      return username;
    } else {
      return null;
    }
  }

  // create user and make sure that the user does not exist use string username and string password
  Future<String> createUser(
    final String username,
    final String password,
    final String email,
  ) async {
    final doesExist =
        _userBox.values.any((user) => user.name == username.toLowerCase());
    // if exists return 'User already exists', else return 'User created', else return 'error'
    if (doesExist) {
      return 'User already exists';
    }
    // user try catch to catch any errors
    try {
      // create user
      final user = User(
        id: Random().nextInt(1000).toString(),
        name: username,
        email: email,
        password: password,
        role: 'user',
        dateCreated: DateTime.now().toString(),
      );
      // add user to box
      await _userBox.add(user);
      // return user created
      return 'User created';
    } on Exception catch (e) {
      // return custom error
      throw CustomError(
          code: 'createUserError',
          message: e.toString(),
          plugin: 'flutter_hive/AuthenticationService/reference: createUser');
    }
  }

  // logout method
  Future<void> logout() async {
    // close box
    await _userBox.close();
  }
}
