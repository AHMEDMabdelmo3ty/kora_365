import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kora/modules/register/cubit/states.dart';

class KoraRegisterCubit extends Cubit<KoraRegisterStates> {
  KoraRegisterCubit() : super(KoraRegisterInitialState());

  static KoraRegisterCubit get(context) => BlocProvider.of(context);

  // RegisterModel? registerModel;
  // ErrorModel? errorModel;

  // void userRegister(
  //     {required String name,
  //     required String email,
  //     required String password,
  //     required String RePassword,
  //     required BuildContext context}) async {
  //   emit(KoraRegisterLoadingState());
  //   print('$name');
  //   print('$email');
  //   print('$password');
  //   print('$RePassword');
  //   await DioHelper.postData(
  //     Url: "register",
  //     data: {
  //       'name': name,
  //       'email': email,
  //       'password': password,
  //       'password_confirmation': RePassword,
  //     },
  //   ).then((value) {
  //     if (value.statusCode == 200 || value.statusCode == 201) {
  //       print('422');
  //       registerModel = RegisterModel.fromJson(value.data);
  //       if (registerModel!.status == true) {
  //         print('register${registerModel!.token}');
  //         print('register${registerModel!.message}');

  //         NavigateAndFinish(context, LoginScreen());
  //         emit(KoraRegisterSuccessState(registerModel!));
  //       } else if (registerModel!.status == false) {
  //         errorModel = ErrorModel.fromJson(value.data);
  //         showToast(
  //             message: "${errorModel!.message}",
  //             toastStates: ToastStates.EROOR);
  //         emit(KoraRegisterSuccessState(registerModel!));
  //       }
  //     }
  //     // print('object');
  //     // print(value.data.toString());

  //     // registerModel = RegisterModel.fromJson(value.data);
  //     // print(value.data);
  //     // print('done y bashaaa');

  //     // NavigateAndFinish(context, LoginScreen());
  //     // emit(KoraRegisterSuccessState(registerModel!));
  //   }).catchError((error) {
  //     //errorModel = ErrorModel.fromJson(error.toString());
  //     //print(errorModel!.message.toString());

  //     print('error y hamouda ${error.toString()}');
  //     showToast(
  //         message: "Please Enter Right Data.", toastStates: ToastStates.EROOR);
  //     emit(KoraRegisterErrorState(error.toString()));
  //   });
  // }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}
