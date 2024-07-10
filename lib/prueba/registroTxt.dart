import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../login/registerData.dart';
import '../selectBox/register/selectBoxRegister.dart';

class RegisterFields extends StatefulWidget {
  final RegisterData registerData;
  final void Function(RegisterData) onUpdate;

  const RegisterFields({
    super.key,
    required this.registerData,
    required this.onUpdate,
  });

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  bool showLegislativeCharges = false;
  bool showPublicAdminCharges = false;
  bool chargeType = false;
  bool passwordsCorrect = true;

  TextEditingController nameRegController = TextEditingController();
  TextEditingController emailRegController = TextEditingController();
  TextEditingController celController = TextEditingController();
  TextEditingController passwordRegController = TextEditingController();
  TextEditingController passwordConfirmRegController = TextEditingController();
  String _selectedPoliticalParty = '';
  String _selectedPublicCharge = '';
  String _selectedLegislativeCharges = '';
  String subCharge = '';

  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodeCel = FocusNode();

  late KeyboardVisibilityController keyboardVisibilityController;
  late StreamSubscription<bool> keyboardVisibilitySubscription;
  bool visibleKeyboard = false;

  bool _isObscured = true;

  void _togglePasswordView() {
    setState(() {
      if (_isObscured == true) {
        _isObscured = false;
      } else if (_isObscured == false) {
        _isObscured = true;
      }
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

  void _onChooseTypeofCharge(bool chooseTypeofCharge) {
    //true = PublicAdming y false = LegislativeCharges

    setState(() {
      if (chooseTypeofCharge == false) {
        showLegislativeCharges = true;
        showPublicAdminCharges = false;
        chargeType = false;
        subCharge = 'null';
        //
        //
      } else if (chooseTypeofCharge == true) {
        showLegislativeCharges = false;
        showPublicAdminCharges = true;
        chargeType = true;
        subCharge = 'null';
      }
    });
  }

  void _onSelectPoliticalParties(String? selectedPoliticalParty) {
    setState(() {
      if (selectedPoliticalParty == null) {
        _selectedPoliticalParty = 'null';
        widget.registerData.politicalParty = _selectedPoliticalParty;
      } else {
        _selectedPoliticalParty = selectedPoliticalParty;
        widget.registerData.politicalParty = _selectedPoliticalParty;
      }
    });
  }

  void _onSelectPublicCharge(String? selectedPublicCharge) {
    setState(() {
      if (selectedPublicCharge == null) {
        _selectedPublicCharge = 'null';
        subCharge = 'null';
        widget.registerData.subCharge = _selectedPublicCharge;
      } else {
        _selectedPublicCharge = selectedPublicCharge;
        subCharge = selectedPublicCharge;
        widget.registerData.subCharge = _selectedPublicCharge;
      }
    });
  }

  void _onSelectLegislativeCharges(String? selectedLegislativeCharges) {
    setState(() {
      if (selectedLegislativeCharges == null) {
        _selectedLegislativeCharges = 'null';
        subCharge = 'null';
        widget.registerData.subCharge = subCharge;
      } else {
        _selectedLegislativeCharges = selectedLegislativeCharges;
        subCharge = selectedLegislativeCharges;
        widget.registerData.subCharge = subCharge;
      }
    });
  }

  void changeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void comparePasswords() {
    setState(() {
      if (passwordRegController.text == passwordConfirmRegController.text) {
        passwordsCorrect = true;
        //
        widget.registerData.name = nameRegController.text;
        widget.registerData.email = emailRegController.text;
        widget.registerData.cel = celController.text;
        widget.registerData.politicalParty = _selectedPoliticalParty;
        widget.registerData.chargeType = chargeType;
        widget.registerData.subCharge = subCharge;
        widget.registerData.password = passwordConfirmRegController.text;
        widget.onUpdate(widget.registerData);
      } else {
        passwordsCorrect = false;
      }
    });
  }

  @override
  void dispose() {
    keyboardVisibilitySubscription.cancel();
    nameRegController.dispose();
    celController.dispose();
    emailRegController.dispose();
    passwordRegController.dispose();
    passwordConfirmRegController.dispose();
    focusNodeName.dispose();
    focusNodeCel.dispose();
    focusNodeEmail.dispose();
    super.dispose();
  }

  @override
  void initState() {
    keyboardVisibilityController = KeyboardVisibilityController();
    checkKeyboardVisibility();
    super.initState();
    focusNodeName;
    focusNodeCel;
    focusNodeEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.034,
              bottom: MediaQuery.of(context).size.width * 0.02),
          child: Row(
            children: [
              Text(
                'Nombre',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.0385,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: TextFormField(
            focusNode: focusNodeName,
            controller: nameRegController,
            decoration: InputDecoration(
              hintText: 'Nombre',
              contentPadding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.025),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onTapOutside: (tapOut) {
              widget.registerData.name = nameRegController.text;
              hideKeyBoard();
            },
            onEditingComplete: () {
              widget.registerData.name = nameRegController.text;
              changeFocus(context, focusNodeName, focusNodeEmail);

              //
              //
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.034,
              top: MediaQuery.of(context).size.width * 0.02),
          child: Row(
            children: [
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.0385,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
              vertical: MediaQuery.of(context).size.width * 0.025),
          child: TextFormField(
            focusNode: focusNodeEmail,
            controller: emailRegController,
            decoration: InputDecoration(
              hintText: 'name@email.com',
              contentPadding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.025),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onTapOutside: (tapOut) {
              widget.registerData.email = emailRegController.text;
              hideKeyBoard();
              widget.registerData.email = emailRegController.text;
              //

              //
            },
            onEditingComplete: () {
              widget.registerData.email = emailRegController.text;
              changeFocus(context, focusNodeEmail, focusNodeCel);
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.034,
              bottom: MediaQuery.of(context).size.width * 0.02),
          child: Row(
            children: [
              Text(
                'Celular',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.0385,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
            bottom: MediaQuery.of(context).size.width * 0.03,
          ),
          child: TextFormField(
            focusNode: focusNodeCel,
            controller: celController,
            decoration: InputDecoration(
              hintText: 'Número de celular',
              contentPadding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.025),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onTapOutside: (tapOut) {
              widget.registerData.cel = celController.text;
              hideKeyBoard();
              //
            },
            onEditingComplete: () {
              widget.registerData.cel = celController.text;
              hideKeyBoard();
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.034,
              bottom: MediaQuery.of(context).size.width * 0.02),
          child: Row(
            children: [
              Text(
                'Partido Político o asociación',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.0385,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
              bottom: MediaQuery.of(context).size.width * 0.03),
          child: PoliticalPartiesBox(
              onSelectPoliticalParties: _onSelectPoliticalParties),
        ),

        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.034,
              bottom: MediaQuery.of(context).size.width * 0.024),
          child: Row(
            children: [
              Text(
                'Funciones',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.0385,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.width * 0.038,
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
          ),
          child:
              PoliticalChargesBox(onChooseTypeofCharge: _onChooseTypeofCharge),
        ),
        //

        Visibility(
          visible: showLegislativeCharges,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
            ),
            child: LegislativeChargesBox(
                onSelectLegislativeCharges: _onSelectLegislativeCharges),
          ),
        ),
        Visibility(
          visible: showPublicAdminCharges,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
            ),
            child: PublicAdminChargesBox(
                onSelectPublicCharge: _onSelectPublicCharge),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.034,
              bottom: MediaQuery.of(context).size.width * 0.024),
          child: Row(
            children: [
              Text(
                'Contraseña',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.0385,
                ),
              ),
            ],
          ),
        ),

        Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
              bottom: MediaQuery.of(context).size.width * 0.03,
            ),
            child: TextFormField(
                obscureText: _isObscured,
                controller: passwordRegController,
                decoration: InputDecoration(
                    errorText: passwordsCorrect
                        ? null
                        : 'Las contraseñas no coinciden',
                    hintText: 'Crea una contraseña',
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),

                    /*  const Icon(CupertinoIcons.eye_slash_fill,
                        color: Colors.grey),*/
                    contentPadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.025),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )))),

        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
            bottom: MediaQuery.of(context).size.width * 0.03,
          ),
          child: TextFormField(
            obscureText: _isObscured,
            controller: passwordConfirmRegController,
            decoration: InputDecoration(
              errorText:
                  passwordsCorrect ? null : 'Las contraseñas no coinciden',
              suffixIcon: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              ),
              hintText: 'Confirma tu contraseña',
              contentPadding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.025),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onTapOutside: (tapOut) {
              hideKeyBoard();
              comparePasswords();
            },
            onEditingComplete: () {
              hideKeyBoard();
              comparePasswords();
            },
          ),
        ),
      ],
    );
  }
}
