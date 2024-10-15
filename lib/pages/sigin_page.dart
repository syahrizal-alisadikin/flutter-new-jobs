import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jobs/models/user_model.dart';
import 'package:flutter_jobs/pages/home_page.dart';
import 'package:flutter_jobs/pages/onboarding_page.dart';
import 'package:flutter_jobs/pages/sigup_page.dart';
import 'package:flutter_jobs/providers/auth_provider.dart';
import 'package:flutter_jobs/providers/user_provider.dart';
import 'package:flutter_jobs/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SiginPage extends StatefulWidget {
  const SiginPage({super.key});

  @override
  State<SiginPage> createState() => _SiginPageState();
}

class _SiginPageState extends State<SiginPage> {
  @override
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isLoading = false;

  String textEmailError = '';

  bool showPassword = false;
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    Widget messageError(String message) {
      return Column(
        children: [
          SizedBox(
            height: 6,
          ),
          Text(
            message,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.red,
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 70,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign',
                style: titleTextStyle,
              ),
              Text(
                'in to your account',
                style: subTitleTextStyle,
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/sign_logo.png',
                      width: 250,
                      height: 240,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: titleTextStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    onChanged: (value) {
                      bool isValid = EmailValidator.validate(value);
                      textEmailError = "Format Email Belum Benar";

                      if (isValid) {
                        setState(() {
                          isEmailValid = true;
                        });
                      } else {
                        setState(() {
                          isEmailValid = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isEmailValid
                                ? Color(0xff4141A4)
                                : Color(0XFFFD4F56)),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 14),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  isEmailValid ? Container() : messageError(textEmailError),
                  SizedBox(height: 20),
                  Text(
                    "Password",
                    style: titleTextStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: showPassword ? false : true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 14),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  isPasswordValid
                      ? Container()
                      : messageError("Password Tidak Boleh Kosong"),
                  SizedBox(height: 40),
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          height: 45,
                          width: 400,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xff4141A4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () async {
                              // print("Login");
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => HomePage()),
                              // );
                              setState(() {
                                isEmailValid = emailController.text.isNotEmpty;
                                isPasswordValid =
                                    passwordController.text.isNotEmpty;
                                isLoading = true;
                              });

// Cek apakah semua field valid
                              if (!isEmailValid || !isPasswordValid) {
                                textEmailError = "Email Tidak Boleh Kosong";

                                setState(() {
                                  isLoading = false;
                                });
                                // Jika ada yang kosong, lakukan sesuatu, misalnya menampilkan pesan error
                              } else {
                                var response = await authProvider.login(
                                  emailController.text,
                                  passwordController.text,
                                );
                                setState(() {
                                  isLoading = false;
                                });
                                // Jika semua field valid, lakukan proses register
                                if (response['statusCode'] != 200) {
                                  print(response);
                                  setState(() {
                                    isEmailValid = false;
                                  });
                                  textEmailError = "Email / Password Salah";
                                } else {
                                  userProvider.user = response['user'];
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => const HomePage()),
                                  // );
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                    (Route<dynamic> route) =>
                                        false, // Mencegah kembali ke halaman sebelumnya
                                  );
                                }
                              }
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SigupPage()),
                        );
                      },
                      child: Text(
                        "Create Account",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff4141A4),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
