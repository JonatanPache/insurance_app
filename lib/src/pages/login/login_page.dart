import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
            child:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 40,
                      //bottom: MediaQuery.of(context).size.height*0.4
                    ),
                    child: Lottie.asset(
                      'assets/json/hello-office.json',
                      width: 250,
                      height: 150,
                      fit: BoxFit.fill
                    ),
                  ),
                  SizedBox(height: 2),
                  //Hola
                  Text(
                    'Hola!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52
                    )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Bienvenido',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                ),
                  SizedBox(
                    height: 50,
                  ),
                //Email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cedula de Identificacion'
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Contrasena'
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                // sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text(
                          'Ingresar',
                        style:TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ) ,
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: 25),
                  // not a member register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No tienes cuenta',
                          style:TextStyle(
                              fontWeight: FontWeight.bold
                          )
                      ),
                      Text(
                        ' Registrate Ahora',
                        style:TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ],
                  )
              ],
          ),
            )
        ),
      ),
    );
  }
}
