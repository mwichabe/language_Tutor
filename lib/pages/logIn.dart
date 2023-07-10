import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_and_found/pages/home.dart';
import 'package:lost_and_found/theme/colors.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Column(
                  children: [
                    Center(
                        child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: miniBackColor),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Title...',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))),
                    const SizedBox(
                      height: 170,
                    ),
                    CircleAvatar(
                      backgroundColor: miniBackColor,
                      radius: 75,
                      //
                      child: SvgPicture.asset(
                        'assets/google.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: ()=> Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (_)=>  Home()
                      )),
                        child: const Text(
                      'Continue with google',
                      style: TextStyle(color: Colors.black),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
