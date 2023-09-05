import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utills/routes/route_name.dart';
import 'package:mvvm/utills/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Signup"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email.',
                    prefixIcon: Icon(Icons.alternate_email)),
                onFieldSubmitted: (valu) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                        controller: _passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: _obscurePassword.value,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obscurePassword.value =
                                    !_obscurePassword.value;
                              },
                              child: Icon(_obscurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility)),
                        ));
                  }),
              SizedBox(
                height: height * 0.1,
              ),
              RoundButton(
                title: 'Login',
                loading: authViewMode.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.FlushbarErrorMessage('Enter email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.FlushbarErrorMessage('Enter password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.FlushbarErrorMessage(
                        'Password length must be greater than 6 characters',
                        context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };

                    authViewMode.loginAPi(data, context);
                    print('API hit');
                  }
                },
              ),
              SizedBox(
                height: height * 0.1,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routesname.signup  );
                },
                child: Text("Don't have an account? Sign up"),
              )
            ],
          ),
        ));
  }
}
