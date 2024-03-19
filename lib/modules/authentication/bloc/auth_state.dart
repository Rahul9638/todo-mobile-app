part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginError extends AuthState {}

class LoginSuccess extends AuthState {}
