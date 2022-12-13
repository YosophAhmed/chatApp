import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(AuthInitial());

  @override
  onChange(Change<AuthState> change){
    super.onChange(change);
    print(change);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        emit(LoginFailure(
          errorMessage: 'User not found!',
        ));
      } else if (error.code == 'wrong-password') {
        emit(LoginFailure(
          errorMessage: 'Wrong password',
        ));
      } else {
        emit(LoginFailure(
          errorMessage: 'Something went wrong',
        ));
      }
    } catch (error) {
      emit(LoginFailure(
        errorMessage: 'Something went wrong',
      ));
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        emit(
          RegisterFailure(
            errorMessage: 'Weak password',
          ),
        );
      } else if (error.code == 'email-already-in-use') {
        emit(
          RegisterFailure(
            errorMessage: 'email already in use',
          ),
        );
      } else {
        emit(
          RegisterFailure(
            errorMessage: 'something went wrong',
          ),
        );
      }
    }
  }
}