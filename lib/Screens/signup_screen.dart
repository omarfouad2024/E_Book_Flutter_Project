import 'package:e_book_flutter_project/Provider/auth_provider.dart';
import 'package:e_book_flutter_project/Screens/login_screen.dart';
import 'package:e_book_flutter_project/Widgets/Custom_Textfiled.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController NameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
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
                  BoxShadow(blurRadius: 10, color: Colors.grey.shade300),
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
                          Icon(
                            Icons.account_balance_sharp,
                            size: 70,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Create Account",
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
                      prefixIcon: Icons.person,
                      controller: NameController,
                      keyboardType: TextInputType.name,
                      ispass: false,
                      label: "Name",
                      hint: "Enter your name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
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
                        if (!value.endsWith("@gmail.com")) {
                          return "Invalid email";
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
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    Customtextfield(
                      prefixIcon: Icons.phone,
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      ispass: false,
                      label: "Phone",
                      hint: "Enter your phone",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter phone";
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
                            await obj.SignUp(
                              email: EmailController.text,
                              Password: PasswordController.text,
                              name: NameController.text,
                              phoneNumber: phoneNumberController.text,
                            );
                            if (obj.model!.statusCode == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("SignUp Successfully"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    obj.model?.message ?? "SignUp Failed",
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16, color: Colors.white),
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
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: const Text("Already have an account? Login"),
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
