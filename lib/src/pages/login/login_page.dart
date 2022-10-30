import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurance_app/src/providers/AuthProvider.dart';
import 'package:lottie/lottie.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  @override
  void initState() {
    super.initState();
    getDeviceName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Form(
            key: _formKey,
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
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (String value) {
                            if (value.trim().isEmpty) return 'enter please email';
                            return null;
                          },
                          onChanged: (text) =>
                              setState(() => errorMessage = ''),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email'
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
                        child: TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: passwordController,
                          validator: (String value) {
                            if (value.isEmpty) return 'enter password';
                            return null;
                          },
                          onChanged: (text) =>
                              setState(() => errorMessage = ''),
                          keyboardType: TextInputType.visiblePassword,
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
                    child: ElevatedButton(
                      onPressed: () => submit(),
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
                  Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
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

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (!form.validate()) return;
    final AuthProvider provider =
    Provider.of<AuthProvider>(context, listen: false);
    try {
      await provider.login(
          emailController.text,
          passwordController.text,
          _deviceData['model']
      );
    } catch (exception) {
      setState(() {
        errorMessage = exception.toString().replaceAll('Exception: ', '');
      });
    }
  }

  Future<void> getDeviceName() async {
    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData =
            _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }
  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
