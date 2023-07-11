import 'package:aplikacija1/display.dart';
import 'package:aplikacija1/register.dart';
import 'package:page_transition/page_transition.dart';
import 'fadeanimation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool _back = false;
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/pjevač.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken))),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      child: FadeAnimation(
                        delay: 0.8,
                        child: Text(
                          'Login to continue.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      child: FadeAnimation(
                        delay: 1,
                        child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: _focusNodes[0].hasFocus
                                      ? Colors.black54
                                      : Colors.black54,
                                ),
                                hintText: 'Username',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 18, 20, 18),
                                fillColor: Colors.white60,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(260)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(260)),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 57, 57, 57),
                                        width: 2.0)))),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: 350,
                      child: FadeAnimation(
                        delay: 1.2,
                        child: TextField(
                          obscureText: _obscureText,
                          focusNode: _focusNodes[0],
                          decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: _focusNodes[0].hasFocus
                                    ? Colors.black54
                                    : Colors.black54,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: _focusNodes[0].hasFocus
                                        ? Colors.black54
                                        : Colors.black54),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 18, 20, 18),
                              fillColor: Colors.white60,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(260)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(260)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 57, 57, 57),
                                      width: 2.0))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      child: FadeAnimation(
                        delay: 1.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: Register(),
                                        type: PageTransitionType.topToBottom,
                                        duration: Duration(milliseconds: 300)));
                                setState(() {
                                  _back = !_back;
                                });
                              },
                              child: Text(
                                '  Register now.',
                                style: TextStyle(
                                    color: _back
                                        ? Color.fromARGB(255, 128, 127, 127)
                                        : Color.fromARGB(255, 76, 76, 76),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 230,
                      child: FadeAnimation(
                        delay: 1.6,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: Display(),
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 400)));
                          },
                          child: Text('Login',
                              style: TextStyle(color: Colors.white70)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: (Size(180, 53)),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(55))),
                            backgroundColor: Color.fromARGB(255, 35, 33, 33),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
