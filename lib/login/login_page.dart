import 'package:ayurveda/authenticate/auth_services.dart';
import 'package:ayurveda/components/square_title.dart';
//import 'package:ayurveda/signUp_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ayurveda/simple_ui_controller.dart';
import 'package:ayurveda/constants.dart';
import 'package:get/get.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SimpleUIController simpleUIController = Get.put(SimpleUIController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Container(
                height: height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                    )),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.060,
                    ),
                    SizedBox(
                        height: height * 0.20,
                        child: Image.asset('assets/log.png')),
                    Text(
                      'Learn Ayurveda and expand Ayurveda',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 20),
                        height: height / 1.8,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Login Account',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.008,
                                  ),

                                  /// username or Gmail
                                  // TextFormField(
                                  // style: kTextFormFieldStyle(),
                                  // decoration: const InputDecoration(
                                  // prefixIcon: Icon(Icons.person),
                                  // hintText: 'Username or Gmail',
                                  // border: OutlineInputBorder(
                                  // borderRadius: BorderRadius.all(Radius.circular(15)),
                                  // ),
                                  // ),
                                  // controller: nameController,
                                  // // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  // if (value == null || value.isEmpty) {
                                  // return 'Please enter username';
                                  // } else if (value.length < 4) {
                                  // return 'at least enter 4 characters';
                                  // } else if (value.length > 13) {
                                  // return 'maximum character is 13';
                                  // }
                                  // return null;
                                  // },
                                  // ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          15, 2, 15, 2),
                                      suffixIcon: Icon(
                                        Icons.email_rounded,
                                        size: 25,
                                      ),
                                      hintText: 'Email or Username',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 13),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter gmail';
                                      } else if (!value
                                          .endsWith('@gmail.com')) {
                                        return 'please enter valid gmail';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),

                                  /// password
                                  Obx(
                                    () => TextFormField(
                                      controller: passwordController,
                                      obscureText:
                                          simpleUIController.isObscure.value,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                15, 2, 15, 2),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            simpleUIController.isObscure.value
                                                ? Icons.visibility_rounded
                                                : Icons.visibility_off_rounded,
                                            size: 25,
                                          ),
                                          onPressed: () {
                                            simpleUIController
                                                .isObscureActive();
                                          },
                                        ),
                                        hintText: 'Password',
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                      ),
                                      style: TextStyle(fontSize: 13),
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        } else if (value.length < 7) {
                                          return 'at least enter 6 characters';
                                        } else if (value.length > 13) {
                                          return 'maximum character is 13';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SwitchListTile.adaptive(
                                    value: true,
                                    onChanged: ((value) {}),
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Text('Remember me',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                ColorConstants.starterWhite)),
                                  ),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(31)),
                                    height: 40,
                                    color: ColorConstants.primaryColor,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        //loginAndAuthenticateUser(context);
                                        signIn();
                                      }
                                    },
                                    child: const Text(
                                      'LOG IN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          thickness: 1,
                                          height: 1,
                                          color: ColorConstants.starterWhite,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text('or',
                                          style: TextStyle(
                                              color:
                                                  ColorConstants.starterWhite,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700)),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Divider(
                                          thickness: 1,
                                          height: 1,
                                          color: ColorConstants.starterWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularTile(
                                          onTap: () =>
                                              AuthService().signInWithGoogle(),
                                          imagePath: 'assets/google-logo1.png'),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      CircularTile(
                                          onTap: () => null,
                                          imagePath: 'assets/facebook.png'),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 11,
                                  ),
                                  Text(
                                    'Forget password?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorConstants.starterWhite),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: widget.showRegisterPage,
                            child: RichText(
                              text: TextSpan(
                                text: 'Don’t have an account?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                    text: " Sign up now",
                                    style: TextStyle(
                                        color: ColorConstants.primaryColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don’t have an account?', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),),
                          const SizedBox(width: 20,),
                          Text('Sign up now', style: TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.w700),)
                        ],
                      ),*/
                      const SizedBox(
                        height: 44,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        displayToastMessage("Incorret email ID", context);
      } else if (e.code == 'wrong-password') {
        displayToastMessage("Incorret password", context);
      }
    }
    Navigator.of(context).pop();
  }
}

// ignore: must_be_immutable
class Input extends StatelessWidget {
  Input({
    Key? key,
    required this.hint,
    required this.icon,
  }) : super(key: key);

  String hint;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: hint,
          labelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide: BorderSide(color: ColorConstants.starterWhite)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(26)),
          ),
          suffixIcon: Icon(icon)),
    );
  }
}
