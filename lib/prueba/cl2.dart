import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:tiktokgov/prueba/registroTxt.dart';
import '../login/registerData.dart';
import 'cl1.dart';

class FadePageView extends StatefulWidget {
  @override
  _FadePageViewState createState() => _FadePageViewState();
}

class _FadePageViewState extends State<FadePageView> {
  late PageController _pageController;
  bool _showLegislativeCharges = false;
  bool _showPublicAdminCharges = false;

  late KeyboardVisibilityController keyboardVisibilityController;
  late StreamSubscription<bool> keyboardVisibilitySubscription;
  bool visibleKeyboard = false;

  //variables del case 1
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //
  TextEditingController nameController = TextEditingController();
  TextEditingController celController = TextEditingController();
  String politicalParty = '';
  String typeOfChargeSelected = '';
  String legislativeCharge = '';
  String publicAdminCharge = '';
  String subCharge = '';
  String passwordRegister = '';

  //
  String usserLog = '';
  String passwordLog = '';
  bool _isObscured = true;

  //
  RegisterData _registerData = RegisterData();

  void _togglePasswordView(bool isObscured) {
    setState(() {
      if (isObscured == true) {
        _isObscured = false;
      } else if (isObscured == false) {
        _isObscured = true;
      }
    });
  }

  void _onLogin(String usserLogSave, String passworLogdSave) {
    setState(() {
      usserLog = usserLogSave;
      passwordLog = passworLogdSave;
    });
  }

  void checkKeyboardVisibility() {
    keyboardVisibilitySubscription =
        keyboardVisibilityController.onChange.listen((visible) {
      setState(() {
        visibleKeyboard = visible;
      });
    });
  }

  void hideKeyBoard() {
    setState(() {
      if (visibleKeyboard) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  void onHandleUptade(RegisterData data) {
    setState(() {
      _registerData = data;
//las propiedades de este objeto son las que te deben de servir para mandar el registro o iniciar sesion
      //el contenido se manda desde registroTxt  al momento de comprobar que las contraseñas son iguales en comparePasswords()
      //me falta controlar ciertos posibles bugs pero ya puedes trabjar con ello
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    celController.dispose();
    passwordController.dispose();
    _pageController.dispose();
    keyboardVisibilitySubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    keyboardVisibilityController = KeyboardVisibilityController();
    checkKeyboardVisibility();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: 2,
      itemBuilder: (context, index) {
        return FadeTransitionPage(
          page: buildPageContent(
            context,
            index,
            _pageController,
            _showLegislativeCharges,
            _showPublicAdminCharges,
            _togglePasswordView,
            _isObscured,
            emailController,
            passwordController,
            visibleKeyboard,
            usserLog,
            passwordLog,
            onHandleUptade,
            _registerData,
            _onLogin,
          ),
        );
      },
    );
  }
}

Widget buildPageContent(
  BuildContext context,
  int index,
  PageController pageController,
  bool showLegislativeCharges,
  bool showPublicAdminCharges,
  Function(bool) onShowPassword,
  bool isObscured,
  TextEditingController emailLogController,
  TextEditingController passwordLogController,
  bool visibleKeyboard,
  String usserLogPassed,
  String passwordLogPassed,
  Function(RegisterData) onHandleUptade,
  RegisterData registerDataPassed,
  Function(String, String) onLogin,
) {
  RegisterData registerData = RegisterData();

  void handleUpdate(RegisterData data) {
    registerData = data;
    print('<<<<<<<<<<<<object>>>>>>>>>>>>');
    print('registerData.name ${registerData.name}');
    print('registerData.email ${registerData.email}');
    print('registerData.cel ${registerData.cel}');
    print('registerData.partido ${registerData.politicalParty}');
    print('registerData.chargeType ${registerData.chargeType}');
    print('registerData.subcharge ${registerData.subCharge}');
    print('registerData.password ${registerData.password}');
    onHandleUptade(registerData);
  }

  bool _isObscured = isObscured;

  void _togglePasswordView() {
    onShowPassword(_isObscured);
  }

  void _onChangePage(int currentPage, PageController pageController) {
    int nextPage = 0;
    if (currentPage == 0) {
      nextPage = 1;
    } else if (currentPage == 1) {
      nextPage = 0;
    }
    pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 1750),
      curve: Curves.easeOutExpo,
    );
  }

  switch (index) {
    case 0:
      return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Column(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: visibleKeyboard
                    ? MediaQuery.of(context).size.height * 0.645
                    : MediaQuery.of(context).size.height * 0.975,
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * 0.135),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.425,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: const DecorationImage(
                            image: AssetImage('assets/landing/log.png'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Portal Democrático',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.075,
                                      fontWeight: FontWeight.bold,
                                    )),
                                ///flybtn
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context, '/videoPlayer');
                                    },
                                    child: const Text('FlyBtn'))
                              ])),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04,
                            vertical: MediaQuery.of(context).size.width * 0.04),
                        child: TextFormField(
                          controller: emailLogController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            contentPadding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 0.025),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onTapOutside: (tapOut) {
                            onLogin(emailLogController.text,
                                passwordLogController.text);
                          },
                          onEditingComplete: () {
                            onLogin(emailLogController.text,
                                passwordLogController.text);
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.04,
                            bottom: MediaQuery.of(context).size.width * 0,
                          ),
                          child: TextFormField(
                            controller: passwordLogController,
                            obscureText: isObscured,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: _togglePasswordView,
                                  child: Icon(
                                    isObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: 'Contraseña',
                                contentPadding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.025),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                )),
                            onTapOutside: (tapOut) {
                              onLogin(emailLogController.text,
                                  passwordLogController.text);
                            },
                            onEditingComplete: () {
                              onLogin(emailLogController.text,
                                  passwordLogController.text);
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.012),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Olvidaste tu contraseña?',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ])),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: Row(children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      ///
                                      print('log $usserLogPassed');
                                      print('contra $passwordLogPassed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      splashFactory: InkRipple.splashFactory,
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0325),
                                      elevation: 5,
                                      surfaceTintColor: const Color(0xFFE6007E),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        side: const BorderSide(
                                            color: Color(0xFF4F2263),
                                            width: 0.7),
                                      ),
                                      backgroundColor: const Color(0xFFE6007E),
                                    ),
                                    child: Text(
                                      'Ingresar',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.042,
                                          color: Colors.white),
                                    )))
                          ])),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Quieres subir contenido? ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0385),
                            ),
                            TextButton(
                                onPressed: () {
                                  _onChangePage(index, pageController);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text(
                                  'Regístrate ahora',
                                  style: TextStyle(color: Colors.blueAccent),
                                ))
                          ])
                    ])))
          ]));
    case 1:
      return Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.055,
                    left: MediaQuery.of(context).size.width * 0.04,
                    bottom: MediaQuery.of(context).size.width * 0.02),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'Registro',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold),
                  )
                ])),
            Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    bottom: MediaQuery.of(context).size.width * 0.028),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text('Crea una cuenta para empezar',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.0385,
                      ))
                ])),
            Column(children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: visibleKeyboard
                      ? MediaQuery.of(context).size.height * 0.42
                      : MediaQuery.of(context).size.height * 0.685,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: RegisterFields(
                      registerData: registerData,
                      onUpdate: handleUpdate,
                    ),
                  ))
            ]),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                child: Row(children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                          },
                          style: ElevatedButton.styleFrom(
                            splashFactory: InkRipple.splashFactory,
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width * 0.0325),
                            elevation: 5,
                            surfaceTintColor: const Color(0xFFE6007E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                  color: Color(0xFF4F2263), width: 0.7),
                            ),
                            backgroundColor: const Color(0xFFE6007E),
                          ),
                          child: Text(
                            'Regístrate',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.042),
                          )))
                ])),
            TextButton(
                onPressed: () {
                  _onChangePage(index, pageController);
                },
                child: const Text(
                  'Ya tienes cuenta? Log On',
                  style: TextStyle(color: Colors.black),
                ))
          ]));
    default:
      return Container();
  }
}

class FadeTransitionPage extends StatelessWidget {
  final Widget page;

  const FadeTransitionPage({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPageViewFade(
      child: page,
    );
  }
}
