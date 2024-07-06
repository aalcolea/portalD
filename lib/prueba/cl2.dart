import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:tiktokgov/prueba/registroTxt.dart';
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
  String passwordRegister = '';

  //
  String usserLog = '';
  String passwordLog = '';

  bool _isObscured = true;

  void _togglePasswordView(bool isObscured) {
    setState(() {
      if (isObscured == true) {
        _isObscured = false;
      } else if (isObscured == false) {
        _isObscured = true;
      }
    });
  }

  void _onChooseTypeofCharge(bool chooseTypeofCharge) {
    setState(() {
      if (chooseTypeofCharge == false) {
        _showLegislativeCharges = true;
        _showPublicAdminCharges = false;
        typeOfChargeSelected = 'Legislativo';
      } else if (chooseTypeofCharge == true) {
        _showLegislativeCharges = false;
        _showPublicAdminCharges = true;
        typeOfChargeSelected = 'Administración Pública';
      }
    });
  }

  void _onNameSave(String nameSave) {
    setState(() {
      nameController.text = nameSave;
    });
  }

  void _onEmailSave(String emailSave) {
    setState(() {
      emailController.text = emailSave;
    });
  }

  void _onCelSave(String celSave) {
    setState(() {
      celController.text = celSave;
    });
  }

  void _onPoliticalPartySave(String politicalPartySave) {
    setState(() {
      politicalParty = politicalPartySave;
    });
  }

  void _onChooseLegislativeCharge(String legislativeChargeSave) {
    setState(() {
      legislativeCharge = legislativeChargeSave;
      publicAdminCharge = '';
    });
  }

  void _onChoosePublicAdminCharge(String publicAdmingChargeSave) {
    setState(() {
      publicAdminCharge = publicAdmingChargeSave;
      legislativeCharge = '';
    });
  }

  void _onChoosePassword(String passwordSave) {
    setState(() {
      passwordRegister = passwordSave;
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
            _onChooseTypeofCharge,
            _showLegislativeCharges,
            _showPublicAdminCharges,
            _togglePasswordView,
            _isObscured,
            emailController,
            passwordController,
            visibleKeyboard,
            _onNameSave,
            nameController.text,
            _onEmailSave,
            emailController.text,
            _onCelSave,
            celController.text,
            _onPoliticalPartySave,
            politicalParty,
            typeOfChargeSelected,
            _onChooseLegislativeCharge,
            legislativeCharge,
            _onChoosePublicAdminCharge,
            publicAdminCharge,
            _onChoosePassword,
            passwordRegister,
            _onLogin,
            usserLog,
            passwordLog,
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
  Function(bool) onChooseTypeofChargePass,
  bool showLegislativeCharges,
  bool showPublicAdminCharges,
  Function(bool) onShowPassword,
  bool isObscured,
  TextEditingController emailLogController,
  TextEditingController passwordLogController,
  bool visibleKeyboard,
  Function(String) onNameSave,
  String namePassed,
  Function(String) onEmailSave,
  String emailPassed,
  Function(String) onCelSave,
  String celPassed,
  Function(String) onPoliticalPartySave,
  String politicalPartyPassed,
  String typeOfPoliticalChargePassed,
  Function(String) onChooseLegislativeCharge,
  String legislativeChargePassed,
  Function(String) onChoosePublicAdminCharge,
  String publicAdminChargePassed,
  Function(String) onChoosePassword,
  String passwordPassed,
  Function(String, String) onLogin,
  String usserLogPassed,
  String passwordLogPassed,
) {
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

  void _onWriteName(String nameField) {
    onNameSave(nameField);
  }

  void _onWriteEmail(String emailField) {
    onEmailSave(emailField);
  }

  void _onWriteCel(String celField) {
    onCelSave(celField);
  }

  void _onChoosePoliticalParty(String politicalParty) {
    onPoliticalPartySave(politicalParty);
  }

  void _onChooseTypeofCharge(bool chooseTypeofCharge) {
    //true = PublicAdming y false = LegislativeCharges
    onChooseTypeofChargePass(chooseTypeofCharge);
  }

  void _onChooseLegislativeCharge(String legislativeCharge) {
    onChooseLegislativeCharge(legislativeCharge);
  }

  void _onChooseAdminPublicCharge(String adminPublicCharge) {
    onChoosePublicAdminCharge(adminPublicCharge);
    print('adminPublicCharge $adminPublicCharge');
  }

  void _onChoosePassword(String passwordField) {
    onChoosePassword(passwordField);
  }

  void _onLogin(String usserField, String passwordField) {
    onLogin(usserField, passwordField);
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
                                    ))
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
                                    onPressed: () {
                                      //widget.onChangePage(currentpage);
                                    },
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
                      onChooseTypeofChargePass: _onChooseTypeofCharge,
                      onWriteName: _onWriteName,
                      onWriteEmail: _onWriteEmail,
                      onWriteCel: _onWriteCel,
                      onChoosePoliticalParty: _onChoosePoliticalParty,
                      onChooseLegislativeCharge: _onChooseLegislativeCharge,
                      onChooseAdminPublicCharge: _onChooseAdminPublicCharge,
                      onChoosePassword: _onChoosePassword,
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
                            print('params to send');
                            print('name:: $namePassed');
                            print('email:: $emailPassed');
                            print('cel:: $celPassed');
                            print('partido:: $politicalPartyPassed');
                            print('cargo:: $typeOfPoliticalChargePassed');
                            print('legislativo:: $legislativeChargePassed');
                            print('publico:: $publicAdminChargePassed');
                            print('contra:: $passwordPassed');
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
