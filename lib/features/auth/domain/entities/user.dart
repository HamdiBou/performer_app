import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User entity representing the authenticated user.
@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String displayName,
    String? photoUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
