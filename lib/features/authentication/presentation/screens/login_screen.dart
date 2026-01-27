import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamenny/features/authentication/data/login_auth_api_service.dart';
import 'package:tamenny/features/authentication/data/login_response_model.dart';
import 'package:tamenny/features/authentication/presentation/widgets/wave_clipper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    checkAutoLogin();
  }

  Future<void> checkAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      // Auto login
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (route) => false,
      );
    }
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    print('📤 Sending login request...');
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');

    try {
      final response = await AuthService.login(
        LoginRequestModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      setState(() => isLoading = false);

      print('📥 API Response received');
      print('Success: ${response.success}');
      print('Message: ${response.message}');
      print('Token: ${response.token}');
      print('User: ${response.user}');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.message)),
      );

      if (response.success) {
        // حفظ Token و User info
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.token ?? '');
        if (response.user != null) {
          await prefs.setString('user', response.user.toString());
        }

        print('✅ Login success → navigating to /recommendations');

        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      } else {
        print('❌ Login failed');
      }
    } catch (e) {
      setState(() => isLoading = false);
      print('🔥 Exception during login: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBF5EF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 280,
                    width: double.infinity,
                    color: const Color(0xff163D53),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/landing',
                        (route) => false,
                      );
                    },
                  ),
                ),
                const Positioned(
                  top: 120,
                  left: 24,
                  child: Text(
                    'Welcome\nBack',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: authInputDecoration('Email'),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Email is required' : null,
                    ),

                    const SizedBox(height: 24),

                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: authInputDecoration('Password'),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Password is required' : null,
                    ),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forget_password');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7F9CAF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Log in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration authInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black38),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
  );
}
