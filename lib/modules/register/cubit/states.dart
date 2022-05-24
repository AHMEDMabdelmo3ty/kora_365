abstract class KoraRegisterStates {}

class KoraRegisterInitialState extends KoraRegisterStates {}

class KoraRegisterLoadingState extends KoraRegisterStates {}

class KoraRegisterSuccessState extends KoraRegisterStates {}

class KoraRegisterErrorState extends KoraRegisterStates {
  final String error;

  KoraRegisterErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends KoraRegisterStates {}
