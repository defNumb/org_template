import 'package:hive/hive.dart';
part 'user.g.dart';

/* 
CLASS DESCRIPTION:

*/
@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String role;
  @HiveField(5)
  final String? dateCreated;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    this.dateCreated,
  });

  // FACTORY METHODS
  //Initial User
  factory User.initial() {
    return User(
      id: '',
      name: '',
      email: '',
      password: '',
      role: '',
      dateCreated: '',
    );
  }
  // METHODS TO DO
  // User from Json
  // User to Json

  // COMODITY SETTINGS

  bool get stringify => true;
}
