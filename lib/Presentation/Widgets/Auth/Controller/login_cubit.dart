import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskhaztec/Data/AppData/app_preferences.dart';
import 'package:taskhaztec/Data/Repository/AuthRepo/auth_repo.dart';

part '../State/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

 loginIt(body) async {
await Future.delayed(const Duration(milliseconds: 16));
    emit(LoginLoading());
    await AuthRepo()
        .login(body)
        .then((value) async {
      log('value ${value}');
      if (value["success"] != null ) {

        emit(LoginError(error:value['error']));
      } if(value['token']!= null ) {
        SharedPrefs.setUserToken(token: value['token']);
        emit(LoginSuccess());
        // var error= jsonDecode(value["body"]);
        // emit(ErrorEmailSigIn(error: error["error"]));
      }
    }).catchError((error) {
      emit(LoginError(error:error.toString()));
    });
  }

}
