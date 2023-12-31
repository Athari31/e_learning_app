import 'package:bloc/bloc.dart';
import 'package:e_learning_app/repos/auth/auth_repo.dart';
import 'package:e_learning_app/repos/main/main_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  void login(String email, String pass) async {
    emit(LoadingLoginState());
    User? user = await MainRepo.authRepo.login(email, pass);
    if (user != null) {
      emit(SuccessLoginState());
    } else {
      emit(ErrorLoginState());
    }
  }
  void Register(String email, String pass, String name) async {
    emit(LoadingLoginState());
    User? user = await MainRepo.authRepo.Register( name ,email, pass);
    if (user != null) {
      emit(SuccessRegesterState());
    } else {
      emit(ErrorRegesterState());
    }
  }
}