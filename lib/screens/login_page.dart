import 'package:bosowa/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameC = TextEditingController()..addListener(() {});
  TextEditingController passwordC = TextEditingController()..addListener(() {});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset('assets/images/logo bosowa.png')),
                  _textFormField(
                      'Username',
                      Icons.account_circle_sharp,
                      usernameC,
                      TextInputType.name,
                      () => setState(() {
                            usernameC.clear();
                          })),
                  const SizedBox(
                    height: 19,
                  ),
                  _textFormField(
                      'Password',
                      Icons.lock,
                      passwordC,
                      TextInputType.number,
                      () => setState(() {
                            passwordC.clear();
                          })),
                  const SizedBox(
                    height: 19,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(16)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13)))),
                        onPressed: () {
                          if (usernameC.text == 'Bosowa' &&
                              passwordC.text == '1234') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LandingPage(),
                                ));
                          }
                        },
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.poppins(),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField _textFormField(
      String label,
      IconData prefix,
      TextEditingController controller,
      TextInputType textInput,
      VoidCallback function) {
    return TextField(
      controller: controller,
      keyboardType: textInput,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            splashRadius: 23,
            onPressed: function,
            icon: const Icon(
              Icons.clear,
              color: Colors.red,
            ),
          ),
          prefixIcon: Icon(prefix),
          label: Text(
            label,
            style: GoogleFonts.poppins(),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
    );
  }
}
