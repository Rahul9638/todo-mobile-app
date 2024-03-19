part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UsersLoaded extends UserState {
  const UsersLoaded({required this.userList});
  final List<UserDetailResponse> userList;
}

class UsersLoading extends UserState {}

class UsersLoadError extends UserState {}
