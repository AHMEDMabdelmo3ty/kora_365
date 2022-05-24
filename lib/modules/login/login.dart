import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kora/layout/home_layout.dart';
import 'package:kora/modules/login/cubit/cubit.dart';
import 'package:kora/modules/login/cubit/states.dart';
import 'package:kora/modules/register/register.dart';
import 'package:kora/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  var EmailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KoraLoginCubit(),
      child: BlocConsumer<KoraLoginCubit, KoraLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset('assets/images/splash.png'),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          'Sign in To Your Account',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          controller: EmailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email';
                            }
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          lines: 1,
                          isPassword:
                              KoraLoginCubit.get(context).isPasswordShowen,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) return 'Password is Too Short';
                            return null;
                          },
                          onSubmit: (value) {
                            // if (formKey.currentState!.validate()) {
                            //   KoraLoginCubit.get(context).UserLogin(
                            //       email: EmailController.text,
                            //       password: passwordController.text,
                            //       context: context);
                            // }
                          },
                          suffix: KoraLoginCubit.get(context).sufix,
                          suffixPressed: () {
                            KoraLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! KoraLoginLoadingStates,
                          builder: (context) => defaultButton(
                            function: () {
                              NavigateTo(context, HomeLayout());
                            },
                            text: 'Sign In',
                            radius: 12.0,
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have An Account?'),
                            defaultTextButton(
                                function: () {
                                  NavigateTo(context, RegisterScreen());
                                },
                                text: 'Sign Up')
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
