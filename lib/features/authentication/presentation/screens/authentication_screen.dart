import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamenny/features/authentication/data/register_request_model.dart';
import 'package:tamenny/features/authentication/data/register_view_model.dart';
//import 'package:tamenny/features/authentication/presentation/screens/login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final ageController = TextEditingController();
  final parentEmailController = TextEditingController();

  bool isChild = false;

  @override
  Widget build(BuildContext context) {
    final registerVM = context.watch<RegisterViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF7EFEA),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// ===== Header =====
              Stack(
                children: [
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF163A4A),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/landing',
                            (route) => false,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 90,
                    left: 24,
                    child: Text(
                      "Create\naccount",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// ===== Form =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _buildTextField(
                      "Name",
                      controller: nameController,
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),

                    _buildTextField(
                      "Email",
                      controller: emailController,
                      validator: (v) =>
                      v!.contains('@') ? null : 'Invalid email',
                    ),

                    _buildTextField(
                      "Age",
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                      onChanged: (value) {
                        final age = int.tryParse(value) ?? 0;
                        setState(() {
                          isChild = age < 16;
                        });
                      },
                    ),

                    /// ===== Parent Email (Child only) =====
                    if (isChild)
                      _buildTextField(
                        "Parent Email",
                        controller: parentEmailController,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Parent email is required';
                          }
                          if (!v.contains('@')) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                      ),

                    _buildTextField(
                      "Password",
                      controller: passwordController,
                      isPassword: true,
                      validator: (v) =>
                      v!.length >= 4 ? null : 'Min 4 characters',
                    ),

                    _buildTextField(
                      "Confirm Password",
                      controller: confirmPasswordController,
                      isPassword: true,
                      validator: (v) => v != passwordController.text
                          ? 'Passwords do not match'
                          : null,
                    ),

                    const SizedBox(height: 30),

                    /// ===== Sign Up Button =====
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: registerVM.isLoading
                            ? null
                            : () async {
                          if (_formKey.currentState!.validate()) {
                            final model = RegisterRequestModel(
                              fullname: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              age: int.parse(ageController.text),
                              parentEmail: isChild
                                  ? parentEmailController.text
                                  : null,
                            );

                            final success =
                            await registerVM.register(model);

                            if (success) {
                              print('Account created!');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Account created!'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                              // بعد SnackBar، نروح للهوم
                              Future.delayed(
                                  const Duration(seconds: 1), () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/home', (route) => false);
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(registerVM.errorMessage ??
                                      'Error'),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7D95A6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: registerVM.isLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// ===== Login Text =====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.black54),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                              color: Color(0xFF163A4A),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ===== Reusable TextField =====
  Widget _buildTextField(
      String hint, {
        required TextEditingController controller,
        bool isPassword = false,
        TextInputType keyboardType = TextInputType.text,
        String? Function(String?)? validator,
        void Function(String)? onChanged,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF163A4A)),
          ),
        ).copyWith(hintText: hint),
      ),
    );
  }
}