import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskhaztec/Data/AppData/app_preferences.dart';


class LocaleCubit extends Cubit<bool?> {
  LocaleCubit({required bool? value}) : super(true){
    getLocale();
  }

  setLocale({required bool? value}) => emit(value);

  getLocale()async{
    bool? val=await SharedPrefs().getLocale()??true;
    emit(val);
  }
}