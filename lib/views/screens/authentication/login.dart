import 'package:flutter/material.dart';
import 'package:music_app/constants/app_info.dart';
import 'package:music_app/constants/style.dart';
import 'package:music_app/utils/text.dart';
import 'package:music_app/views/components/custom_alert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isShowPassword = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlert(
            title: "Login",
            messageType: MessageType.common,
            message: emailController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: getWidth(context),
      decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
            image: AssetImage('assets/images/background_login.jpg'),
            fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.all(60),
        decoration: const BoxDecoration(color: Color.fromRGBO(40, 40, 40, 0.7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log In',
              style: textBoldStyle.merge(const TextStyle(
                  fontSize: 36, color: Color.fromRGBO(35, 202, 108, 1))),
            ),
            const SizedBox(height: 20),
            TextField(
                controller: emailController,
                cursorColor: Colors.white,
                style: textStyle,
                decoration: InputDecoration(
                    label: const Text("Email"),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelStyle: textStyle,
                    hintStyle: textStyle,
                    prefixIconColor: Colors.white,
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: placeholderTextForm("email")),
                keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              cursorColor: Colors.white,
              style: textStyle,
              decoration: InputDecoration(
                  label: const Text("Password"),
                  labelStyle: textStyle,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintStyle: textStyle,
                  prefixIconColor: Colors.white,
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: placeholderTextForm("password"),
                  suffixIconColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(!isShowPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                  )),
              obscureText: !isShowPassword,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password",
                  style: textStyle.merge(const TextStyle(
                      fontSize: 14, color: Color.fromRGBO(35, 202, 108, 1))),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: getWidth(context) - 50,
              height: 50,
              child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(35, 202, 108, 1)),
                  child: Text('Log in',
                      style:
                          textBoldStyle.merge(const TextStyle(fontSize: 20)))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: textStyle,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Register",
                    style: textStyle.merge(const TextStyle(
                        fontSize: 14, color: Color.fromRGBO(35, 202, 108, 1))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
