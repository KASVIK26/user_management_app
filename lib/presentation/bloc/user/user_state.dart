import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {
  final List<Map<String, dynamic>> users;

  const UserLoading({this.users = const []});

  @override
  List<Object?> get props => [users];
}

class UserLoaded extends UserState {
  final List<Map<String, dynamic>> users;
  final bool hasReachedMax;

  const UserLoaded({
    required this.users,
    this.hasReachedMax = false,
  });

  UserLoaded copyWith({
    List<Map<String, dynamic>>? users,
    bool? hasReachedMax,
  }) {
    return UserLoaded(
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [users, hasReachedMax];
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);

  @override
  List<Object?> get props => [message];
} 