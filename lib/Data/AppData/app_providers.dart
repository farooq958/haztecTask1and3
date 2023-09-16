import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskhaztec/Presentation/Widgets/Auth/Controller/login_cubit.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/ProductHome/Controller/product_cubit.dart';
import 'package:taskhaztec/Presentation/Widgets/locale_cubit.dart';



List<BlocProvider> appProviders = [

  BlocProvider<LoginCubit>(create: (context)=>LoginCubit()),
  BlocProvider<ProductCubit>(create: (context)=>ProductCubit()),
  BlocProvider<LocaleCubit>(
    create: (context) => LocaleCubit(value: false),
  ),

];
