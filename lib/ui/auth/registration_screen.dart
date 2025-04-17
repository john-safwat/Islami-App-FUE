import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:islami_app_fue/core/theme/app_colors.dart';
import 'package:islami_app_fue/core/util/validators.dart';
import 'package:islami_app_fue/data/firebase/firebase_auth_remote_datasource.dart';
import 'package:toastification/toastification.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool passwordVisible = false;
  bool rePasswordVisible = false;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
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
                validator: (value) => Validators.nameValidation(value ?? ""),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user_outline),
                  hintText: "Name",
                ),
              ),
              SizedBox(height: 16),
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
                obscureText: !passwordVisible,
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
                        passwordVisible = !passwordVisible;
                      });
                    },
                    child: Icon(
                      passwordVisible
                          ? Iconsax.eye_outline
                          : Iconsax.eye_slash_outline,
                    ),
                  ),
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 16),

              TextFormField(
                obscureText: !rePasswordVisible,
                style: Theme.of(context).textTheme.titleSmall,
                controller: rePasswordController,
                validator:
                    (value) => Validators.rePasswordValidation(
                      value ?? "",
                      passwordController.text,
                    ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.lock_outline),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        rePasswordVisible = !rePasswordVisible;
                      });
                    },
                    child: Icon(
                      rePasswordVisible
                          ? Iconsax.eye_outline
                          : Iconsax.eye_slash_outline,
                    ),
                  ),
                  hintText: "Re-Password",
                ),
              ),

              SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  _createUserAccount();
                },
                child:
                    isLoading
                        ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.black,
                          ),
                        )
                        : Text("Create Account"),
              ),
              SizedBox(height: 16),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Already Have Account ?",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _createUserAccount() async {
    if (isLoading) return;
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = !isLoading;
      });
      FirebaseAuthRemoteDatasource remoteDatasource =
          FirebaseAuthRemoteDatasource();
      var message = await remoteDatasource.createUserAccount(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );
      setState(() {
        isLoading = !isLoading;
      });
      toastification.show(
        context: context,
        title: Text(message),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 5),
        style: ToastificationStyle.flat,
        type:
            message.contains("Account Created Successfully")
                ? ToastificationType.success
                : ToastificationType.error,
      );
    }
  }
}
