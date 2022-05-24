abstract class KoraLoginStates {}

class KoraLoginInitialStates extends KoraLoginStates {}

class KoraLoginLoadingStates extends KoraLoginStates {}

class KoraLoginSucessStates extends KoraLoginStates {}

class KoraLoginErrorStates extends KoraLoginStates {
  final String error;
  KoraLoginErrorStates(this.error);
}

class KoraChangePasswordVisibilityStates extends KoraLoginStates {}
