abstract class AuthState{}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  String errorMessage;

  LoginFailure({required this.errorMessage});
}

class RegisterLoading extends AuthState{}

class RegisterSuccess extends AuthState{}

class RegisterFailure extends AuthState{
  String errorMessage;
  RegisterFailure({required this.errorMessage});
}