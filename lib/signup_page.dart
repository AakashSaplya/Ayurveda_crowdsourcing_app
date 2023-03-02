// TODO Implement this library.import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ayurveda/simple_ui_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../constants.dart';
import 'Home/profile_screen.dart';
import 'authenticate/auth_services.dart';
import 'components/square_title.dart';

class SignUpClass extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpClass({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);
  static const String idScreen = "signUp";

  @override
  State<SignUpClass> createState() => _SignUpClassState();
}

class _SignUpClassState extends State<SignUpClass> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          height: height,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            clipBehavior: Clip.antiAlias,
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
                    const Text(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'SignUp Account',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),

                                  /// username
                                  TextFormField(
                                    style: const TextStyle(fontSize: 13),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(15, 2, 15, 2),
                                      suffixIcon: Icon(Icons.person),
                                      hintText: 'Username',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                      ),
                                    ),
                                    controller: nameController,
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter username';
                                      } else if (value.length < 4) {
                                        return 'at least enter 4 characters';
                                      } else if (value.length > 13) {
                                        return 'maximum character is 13';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),

                                  /// Gmail
                                  TextFormField(
                                    style: const TextStyle(fontSize: 13),
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(15, 2, 15, 2),
                                      suffixIcon: Icon(Icons.email_rounded),
                                      hintText: 'Gmail',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                      ),
                                    ),
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
                                      style: const TextStyle(fontSize: 13),
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
                                                ? Icons.visibility
                                                : Icons.visibility_off,
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
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorConstants.starterWhite,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),

                                  SizedBox(
                                    width: width * 1,
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(31)),
                                      height: 40,
                                      color: ColorConstants.primaryColor,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          //loginAndAuthenticateUser(context);
                                          signUp();
                                        }
                                      },
                                      child: const Text(
                                        'SIGN UP',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
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
                        /// Navigate To Login Screen
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: widget.showLoginPage,
                            child: RichText(
                              text: TextSpan(
                                text: 'Already have an account?',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                    text: " Login",
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

  Future signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException {
      displayToastMessage("Email alerady exists", context);
    }
    addUserDetails(
      nameController.text.trim(),
      emailController.text.trim(),
    );
    Navigator.of(context).pop();
  }

  Future addUserDetails(String Username, String email) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .set({'Username': Username, 'Email': email});
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
