import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants/constants.dart';
import 'package:flutter_application_7/pages/root.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    bool isLogin = true;
    void toggleForm() {
      setState(() {
        isLogin = !isLogin;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: Image.asset(
                'assets/images/back.png',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Welcome Back",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text("Login to your account ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 114, 114, 114),
                          )),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          login(
                            obscureTextpass: false,
                            lable: 'Full Name',
                            iconss: const Icon(Icons.account_circle),
                          ),
                          login(
                            obscureTextpass: true,
                            lable: 'password',
                            iconss: const Icon(Icons.password_sharp),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RootPage(),
                                  ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(178, 3, 122, 23),
                                borderRadius: BorderRadius.circular(44),
                              ),
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class login extends StatefulWidget {
  String lable;
  Icon iconss;
  bool obscureTextpass;

  login({
    Key? key,
    required this.lable,
    required this.iconss,
    required this.obscureTextpass,
  }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late bool _obscureText;

  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _obscureText = widget.obscureTextpass;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextFormField(
          cursorColor: Constants.primaryColor,
          obscureText: _obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            prefixIcon: widget.iconss,
            labelText: widget.lable,
            suffixIcon: widget.obscureTextpass
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        300 / 2, size.width, size.width + 55, size.height - 230);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
