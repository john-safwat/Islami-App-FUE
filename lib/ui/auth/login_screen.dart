import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:islami_app_fue/core/routs/app_routs.dart';
import 'package:islami_app_fue/core/theme/app_colors.dart';
import 'package:islami_app_fue/core/util/validators.dart';
import 'package:islami_app_fue/data/firebase/firebase_auth_remote_datasource.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = false;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/header_logo.png",
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                ],
              ),
              SizedBox(height: 24),
              TextFormField(
                style: Theme.of(context).textTheme.titleSmall,
                controller: emailController,
                validator: (value) => Validators.emailValidation(value ?? ""),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.sms_outline),
                  hintText: "Email",
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: !visible,
                controller: passwordController,
                validator:
                    (value) => Validators.passwordValidation(value ?? ""),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: Theme.of(context).textTheme.titleSmall,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.lock_outline),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    child: Icon(
                      visible ? Iconsax.eye_outline : Iconsax.eye_slash_outline,
                    ),
                  ),
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      //todo navigate to forget password screen
                    },
                    child: Text("Forget Password ?"),
                  ),
                ],
              ),
              SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  _login();
                },
                child:
                    isLoading
                        ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.black,
                          ),
                        )
                        : Text("Login"),
              ),
              SizedBox(height: 16),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Don’t Have Account ?",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouts.registration);
                    },
                    child: Text("Create Account"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    if (isLoading) return;
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = !isLoading;
      });
      FirebaseAuthRemoteDatasource remoteDatasource =
          FirebaseAuthRemoteDatasource();
      var message = await remoteDatasource.loginUserAccount(
        email: emailController.text,
        password: passwordController.text,
      );
      setState(() {
        isLoading = !isLoading;
      });
      if (message.contains("Login Success")) {
        Navigator.pushReplacementNamed(context, AppRouts.home);
      } else {
        toastification.show(
          context: context,
          title: Text(message),
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 5),
          style: ToastificationStyle.flat,
          type: ToastificationType.error,
        );
      }
    }
  }
}

