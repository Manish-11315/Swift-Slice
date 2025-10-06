import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String address;
  final String? imageUrl;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, email, address, imageUrl];
}
