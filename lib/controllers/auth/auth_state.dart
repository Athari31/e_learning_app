part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//! -----------------------------------------------
class LoadingLoginState extends AuthState {}

class SuccessLoginState extends AuthState {}

class ErrorLoginState extends AuthState {}
//! -----------------------------------------------
class LoadingRegesterState extends AuthState {}

class SuccessRegesterState extends AuthState {}

class ErrorRegesterState extends AuthState {}