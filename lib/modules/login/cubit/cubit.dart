import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kora/modules/login/cubit/states.dart';

import '../../../shared/network/remote/dio_helper.dart';

class KoraLoginCubit extends Cubit<KoraLoginStates> {
  KoraLoginCubit() : super(KoraLoginInitialStates());

  static KoraLoginCubit get(context) => BlocProvider.of(context);
  // LoginModel? KoraLoginModel;
  // void UserLogin(
  //     {required String email,
  //     required String password,
  //     required BuildContext? context}) {
  //   emit(KoraLoginLoadingStates());
  //   DioHelper.postData(
  //     Url: 'login',
  //     data: {
  //       'email': email,
  //       'password': password,
  //     },
  //   ).then((value) {
  //     KoraLoginModel = LoginModel.fromJson(value.data);
  //     print(value.toString());
  //     print('hamouda login y basha ');

  //     if (KoraLoginModel!.token != null) {
  //       NavigateAndFinish(context, const HomeScreen());
  //       emit(KoraLoginSucessStates(KoraLoginModel!));
  //     } else {
  //       showToast(message: "Wrong Login", toastStates: ToastStates.EROOR);
  //       emit(KoraLoginErrorStates('error'));
  //     }
  //   }).catchError((error) {
  //     showToast(
  //         message: 'Enter Your Email and Password',
  //         toastStates: ToastStates.EROOR);
  //     emit(KoraLoginErrorStates(error.toString()));
  //   });
  // }

  IconData sufix = Icons.visibility_outlined;
  bool isPasswordShowen = true;

  void changePasswordVisibility() {
    print("isPasswordShowen : $isPasswordShowen");
    isPasswordShowen = !isPasswordShowen;
    sufix = isPasswordShowen
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(KoraChangePasswordVisibilityStates());
  }
}
