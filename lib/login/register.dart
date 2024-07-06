import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktokgov/selectBox/register/selectBoxRegister.dart';

class Register extends StatefulWidget {
  final void Function(int) onChangePage;

  const Register({super.key, required this.onChangePage});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _showLegislativeCharges = false;
  bool _showPublicAdminCharges = false;
  int currentpage = 0;
  int nextPage = 0;

  void _onChooseTypeofCharge(bool chooseTypeofCharge) {
    setState(() {
      if (chooseTypeofCharge == false) {
        _showLegislativeCharges = true;
        _showPublicAdminCharges = false;
      } else if (chooseTypeofCharge == true) {
        _showLegislativeCharges = false;
        _showPublicAdminCharges = true;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentpage = 1;
    nextPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.055,
                left: MediaQuery.of(context).size.width * 0.04,
                bottom: MediaQuery.of(context).size.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Registro',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.055,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                bottom: MediaQuery.of(context).size.width * 0.028),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Crea una cuenta para empezar',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.width * 0.0385,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
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
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0385,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Nombre',
                              contentPadding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.025),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
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
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0385,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04,
                              vertical:
                                  MediaQuery.of(context).size.width * 0.025),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'name@email.com',
                              contentPadding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.025),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
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
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0385,
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
                            decoration: InputDecoration(
                              hintText: 'Número de celular',
                              contentPadding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.025),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
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
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0385,
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
                          child: PoliticalPartiesBox(onSelectPoliticalParties: (a ) {  },),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.034,
                              bottom:
                                  MediaQuery.of(context).size.width * 0.024),
                          child: Row(
                            children: [
                              Text(
                                'Funciones',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0385,
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
                          child: PoliticalChargesBox(
                              onChooseTypeofCharge: _onChooseTypeofCharge),
                        ),
                        //

                        Visibility(
                          visible: _showLegislativeCharges,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.03,
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                            ),
                            child: LegislativeChargesBox(onSelectLegislativeCharges: (asa ) {  },),
                          ),
                        ),
                        Visibility(
                          visible: _showPublicAdminCharges,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.03,
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                            ),
                            child: PublicAdminChargesBox(onSelectPublicCharge: (a ) {  },),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.034,
                              bottom:
                                  MediaQuery.of(context).size.width * 0.024),
                          child: Row(
                            children: [
                              Text(
                                'Contraseña',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0385,
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
                            decoration: InputDecoration(
                              hintText: 'Crea una contraseña',
                              suffixIcon: const Icon(
                                  CupertinoIcons.eye_slash_fill,
                                  color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.025),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.04,
                            bottom: MediaQuery.of(context).size.width * 0.03,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                  CupertinoIcons.eye_slash_fill,
                                  color: Colors.grey),
                              hintText: 'Confirma tu contraseña',
                              contentPadding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.025),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      splashFactory: InkRipple.splashFactory,
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.0325),
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
                          fontSize: MediaQuery.of(context).size.width * 0.042),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              widget.onChangePage(currentpage);
            },
            child: const Text(
              'Ya tienes cuenta? Log On',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
