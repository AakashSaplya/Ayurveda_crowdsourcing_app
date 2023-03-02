import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ayurveda/simple_ui_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../constants.dart';

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
                      height: height * 0.40,
                    ),
                    SizedBox(
                        height: height * 0.10,
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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                /// username
                                TextFormField(
                                  style: kTextFormFieldStyle(),
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    hintText: 'Username',
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
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
                                  height: height * 0.02,
                                ),

                                /// Email
                                TextFormField(
                                  style: kTextFormFieldStyle(),
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.email_rounded),
                                    hintText: 'Email',
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                  ),
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter email';
                                    } else if (!value.endsWith('@gmail.com')) {
                                      return 'please enter valid gmail';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),

                                /// password
                                Obx(
                                  () => TextFormField(
                                    style: kTextFormFieldStyle(),
                                    controller: passwordController,
                                    obscureText:
                                        simpleUIController.isObscure.value,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.lock_open),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          simpleUIController.isObscure.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          simpleUIController.isObscureActive();
                                        },
                                      ),
                                      hintText: 'Password',
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
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
                                  style: kLoginTermsAndPrivacyStyle(size),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),

                                /// SignUp Button
                                signUpButton(theme),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),

                                /// Navigate To Login Screen
                                GestureDetector(
                                  onTap: widget.showLoginPage,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Already have an account?',
                                      style: kHaveAnAccountStyle(size),
                                      children: [
                                        TextSpan(
                                            text: " Login",
                                            style:
                                                kLoginOrSignUpTextStyle(size)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
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

// SignUp Button
  Widget signUpButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          signUp();
        },
        child: const Text('Sign up'),
      ),
    );
  }

  Future signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
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
    Navigator.of(context).pop();
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
