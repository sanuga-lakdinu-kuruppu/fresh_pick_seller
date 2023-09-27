import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/auth_page/bloc/auth_page_bloc.dart';

// ignore: must_be_immutable
class LoginEmailPage extends StatelessWidget {
  LoginEmailPage({super.key});

  late AuthPageBloc authPageBloc;

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    authPageBloc = BlocProvider.of<AuthPageBloc>(context);
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/vegetable_back.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hii!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.536803,
                          width: MediaQuery.of(context).size.width * 0.824766,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                color: Colors.white.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 40),
                                  child: Column(
                                    children: [
                                      Container(
                                        // width: MediaQuery.of(context).size.width *
                                        //     0.70093,
                                        height: 67,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0, top: 10),
                                          child: TextField(
                                            controller: emailController,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    'Ex: vishava@gmail.com',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            minimumSize: Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.70093,
                                                67),
                                            backgroundColor: Colors.greenAccent,
                                            foregroundColor: Colors.white),
                                        onPressed: () {
                                          authPageBloc.add(
                                              AuthPageNextButtonClickedEvent(
                                                  email: emailController.text));
                                        },
                                        child: const Center(
                                          child: Text('Next',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      const Text(
                                        '- - - Or - - -',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 15),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          minimumSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70093,
                                              67),
                                          backgroundColor: Colors.white,
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.0),
                                              child: Text(
                                                'Login with Google',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              height: 32,
                                              width: 32,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/google_logo.png'))),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          const Text(
                                            'Dont have an account?',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              authPageBloc.add(
                                                  AuthPageSignUpButtonClickedEvent());
                                            },
                                            child: const Text(
                                              ' Sign Up',
                                              style: TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: const Text(
                                              'Forgot your password?',
                                              style: TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
