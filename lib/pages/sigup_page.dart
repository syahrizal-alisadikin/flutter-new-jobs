import 'dart:ffi';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jobs/models/user_model.dart';
import 'package:flutter_jobs/pages/home_page.dart';
import 'package:flutter_jobs/pages/sigin_page.dart';
import 'package:flutter_jobs/providers/auth_provider.dart';
import 'package:flutter_jobs/providers/user_provider.dart';
import 'package:flutter_jobs/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SigupPage extends StatefulWidget {
  const SigupPage({super.key});

  @override
  State<SigupPage> createState() => _SigupPageState();
}

class _SigupPageState extends State<SigupPage> {
  @override
  bool isEmailValid = true;
  String textEmailError = '';
  bool isNameValid = true;
  bool isPasswordValid = true;
  bool isGoalValid = true;
  bool isImage = true;
  bool showPassword = false;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController goalController = TextEditingController();
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

    Widget SignupButton() {
      return Container(
        height: 45,
        width: 400,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color(0xff4141A4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () async {
            setState(() {
              isNameValid = nameController.text.isNotEmpty;
              isEmailValid = emailController.text.isNotEmpty;
              isPasswordValid = passwordController.text.isNotEmpty;
              isGoalValid = goalController.text.isNotEmpty;
              isLoading = true;
            });
            // UserModel? user = await authProvider.register(
            //   emailController.text,
            //   passwordController.text,
            //   nameController.text,
            //   goalController.text,
            // );
            var response = await authProvider.register(
              emailController.text,
              passwordController.text,
              nameController.text,
              goalController.text,
            );
// Cek apakah semua field valid
            if (!isNameValid ||
                !isEmailValid ||
                !isPasswordValid ||
                !isGoalValid) {
              textEmailError = "Email Tidak Boleh Kosong";

              setState(() {
                isLoading = false;
              });
              // Jika ada yang kosong, lakukan sesuatu, misalnya menampilkan pesan error
            } else {
              setState(() {
                isLoading = false;
              });
              // Jika semua field valid, lakukan proses register
              if (response['statusCode'] != 200) {
                print(response);
                setState(() {
                  isEmailValid = false;
                });
                textEmailError = "Email Sudah Terdaftar";
              } else {
                userProvider.user = response['user'];
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            }
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 70,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SigUp Flutter Jobs",
                style: titleTextStyle,
              ),
              Text(
                'Silahkan Register',
                style: subTitleTextStyle,
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isImage = !isImage;
                        });
                      },
                      child: Image.asset(
                        isImage
                            ? 'assets/user_pic.png'
                            : 'assets/sign_logo.png',
                        width: 200,
                        height: 180,
                        fit: BoxFit.contain,
                      ),
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
                    "First Name",
                    style: titleTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: nameController,
                    onChanged: (value) {
                      setState(() {
                        isNameValid = value
                            .isNotEmpty; // Set langsung berdasarkan kondisi value
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isNameValid
                                ? Color(0xff4141A4)
                                : Color(0XFFFD4F56)),
                      ),
                      labelText: 'First Name',
                      labelStyle: TextStyle(fontSize: 14),
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                  ),
                  isNameValid
                      ? Container()
                      : messageError("Name Tidak Boleh Kosong"),
                  SizedBox(
                    height: 20,
                  ),
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
                    onChanged: (value) {
                      setState(() {
                        isPasswordValid = value
                            .isNotEmpty; // Set langsung berdasarkan kondisi value
                      });
                    },
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Keahlian",
                    style: titleTextStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: goalController,
                    onChanged: (value) {
                      setState(() {
                        isGoalValid = value
                            .isNotEmpty; // Set langsung berdasarkan kondisi value
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4141A4)),
                      ),
                      labelText: 'Keahlian',
                      labelStyle: TextStyle(fontSize: 14),
                      prefixIcon: Icon(Icons.add_reaction_rounded),
                    ),
                  ),
                  isGoalValid
                      ? Container()
                      : messageError("Goal Tidak Boleh Kosong"),
                  SizedBox(height: 40),
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SignupButton(),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SiginPage()),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff4141A4),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
