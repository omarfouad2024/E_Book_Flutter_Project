import 'package:e_book_flutter_project/Provider/auth_provider.dart';
import 'package:e_book_flutter_project/Screens/home_page.dart';
import 'package:e_book_flutter_project/Screens/signup_screen.dart';
import 'package:e_book_flutter_project/Widgets/Custom_Textfiled.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<Authprovider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey.shade100, 
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Column(
                        children: [
                          Icon(Icons.article,
                              size: 70, color: Colors.blue),
                          SizedBox(height: 10),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Customtextfield(
                      prefixIcon: Icons.email,
                      controller: EmailController,
                      keyboardType: TextInputType.emailAddress,
                      ispass: false,
                      label: "Email",
                      hint: "Enter your email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your email";
                        }
                       
                        return null;
                      },
                    ),

                    const SizedBox(height: 15),
                    Customtextfield(
                      prefixIcon: Icons.lock,
                      controller: PasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      ispass: true,
                      label: "Password",
                      hint: "Enter your password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter password";
                        }
                        if (value.length < 6) {
                          return "Password must be > 6 chars";
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return "Must contain uppercase letter";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            await obj.Login(
                              email: EmailController.text,
                              Password: PasswordController.text,
                            );

                            if (obj.model?.statusCode == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Login Successfully"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePageScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(obj.model!.message),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 16,color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                        child: const Text(
                          "Don't have an account? Sign Up",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
