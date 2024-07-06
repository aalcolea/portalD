import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final void Function(int) onChangePage;

  const Login({super.key, required this.onChangePage});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool txtBtnPressed = false;
  int currentpage = 0;
  int nextPage = 0;
  final pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentpage = 0;
    nextPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(
            (MediaQuery.of(context).size.width * 0.025) / 15),
      ),
      child: Column(
        children: [
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
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Portal Democrático',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.075,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.width * 0.04),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                contentPadding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.025),
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
              bottom: MediaQuery.of(context).size.width * 0,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  CupertinoIcons.eye_slash_fill,
                  color: Colors.grey,
                ),
                hintText: 'Contraseña',
                contentPadding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.025),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.012),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    widget.onChangePage(currentpage);
                  },
                  child: const Text(
                    'Olvidaste tu contraseña?',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
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
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(
                            color: Color(0xFF4F2263), width: 0.7),
                      ),
                      backgroundColor: const Color(0xFFE6007E),
                    ),
                    child: Text(
                      'Ingresar',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.042,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quieres subir contenido?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.0385),
              ),
              TextButton(
                onPressed: () {
                  widget.onChangePage(currentpage);
                },
                child: const Text(
                  'Regístrate ahora',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
