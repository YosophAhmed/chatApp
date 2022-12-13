import 'package:chat/pages/auth_bloc/auth_event.dart';
import 'package:chat/pages/auth_bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc() : super(AuthInitial()){
    @override
    void onTransition(Transition<AuthEvent, AuthState> transition){
      super.onTransition(transition);
      print(transition);
    }
    on<AuthEvent>((event, emit) async {
        if(event is LoginEvent) {
          emit(LoginLoading());
          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email,
              password: event.password,
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
    });
  }
}