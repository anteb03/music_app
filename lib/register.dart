import 'package:aplikacija1/fadeanimation.dart';
import 'package:aplikacija1/login.dart';
import 'package:aplikacija1/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var checkbox = false;
  bool _back = false;
  bool _obscureText = true;
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

  bool __obscureText = true;
  List<FocusNode> __focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
            child: Center(
                child: Container(
              width: 360,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: Login(),
                          type: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 130)));
                  setState(() {
                    _back = !_back;
                  });
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back,
                    color: _back ? Colors.grey : Colors.white,
                    size: 25,
                  ),
                ),
              ),
            )),
          ),
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    child: FadeAnimation(
                      delay: 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      hintText: 'Name',
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      fillColor: Colors.white60,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(260)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(260)),
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 76, 76, 76),
                                              width: 2.0)))),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      hintText: 'Surname',
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      fillColor: Colors.white60,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(260)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(260)),
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 76, 76, 76),
                                              width: 2.0)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 350,
                    child: FadeAnimation(
                      delay: 1.0,
                      child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: _focusNodes[0].hasFocus
                                    ? Colors.black54
                                    : Colors.black54,
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                      color: Color.fromARGB(255, 76, 76, 76),
                                      width: 2.0)))),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: 350,
                    child: FadeAnimation(
                      delay: 1.1,
                      child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Username',
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: _focusNodes[0].hasFocus
                                    ? Colors.black54
                                    : Colors.black54,
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                      color: Color.fromARGB(255, 76, 76, 76),
                                      width: 2.0)))),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: 350,
                    child: FadeAnimation(
                      delay: 1.2,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
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
                            contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                    color: Color.fromARGB(255, 76, 76, 76),
                                    width: 2.0))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: 350,
                    child: FadeAnimation(
                      delay: 1.3,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: __obscureText,
                        focusNode: __focusNodes[0],
                        decoration: InputDecoration(
                            hintText: 'Confirm password',
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: __focusNodes[0].hasFocus
                                  ? Colors.black54
                                  : Colors.black54,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  __obscureText = !__obscureText;
                                });
                              },
                              child: Icon(
                                  __obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: __focusNodes[0].hasFocus
                                      ? Colors.black54
                                      : Colors.black54),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                    color: Color.fromARGB(255, 76, 76, 76),
                                    width: 2.0))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    child: FadeAnimation(
                      delay: 1.4,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: checkbox,
                                onChanged: (value) {
                                  setState(() {
                                    checkbox = !checkbox;
                                  });
                                },
                                side:
                                    BorderSide(color: Colors.white, width: 1.5),
                                activeColor: Color.fromARGB(255, 76, 76, 76),
                                checkColor: Colors.white),
                            Text(
                              'I agree to the terms and conditions and the privacy policy.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 230,
                    child: FadeAnimation(
                      delay: 1.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: WelcomePage(),
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 400)));
                        },
                        child: Text('Register',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          minimumSize: (Size(180, 53)),
                          textStyle: TextStyle(fontSize: 20),
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
    );
  }
}
