import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart'; // For showing toast messages

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  bool _isLoading = false;

  Future<void> _signUp() async {
    final String email = _phoneOrEmailController.text.trim();
    final String password = _passwordController.text.trim();
    final String confirmPassword = _confirmPasswordController.text.trim();

    // Basic Validation
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || password != confirmPassword) {
      _showError('Please ensure all fields are filled correctly and passwords match.');
      return;
    }

    // Email validation (Ensure it ends with @gmail.com)
    if (!email.endsWith('@gmail.com')) {
      _showError('Email must end with @gmail.com');
      return;
    }

    // Password validation (Password length should be at least 6 characters)
    if (password.length < 6) {
      _showError('Password must be at least 6 characters');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Create User with Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Show success toast
      Fluttertoast.showToast(msg: 'Sign up successful');

      // Navigate to Welcome Screen
      
      Navigator.pushReplacementNamed(context, '/welcome'); // Redirect to WelcomeScreen

    } on FirebaseAuthException catch (e) {
      // Handle Firebase exceptions
      _showError(e.message ?? 'An unknown error occurred');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Method to show error dialog
  void _showError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background container with gradient color
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 179, 11, 11),
                  Color.fromARGB(255, 110, 41, 59),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Create Your\nAccount',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Foreground container for the registration form
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Full Name TextField
                    TextField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.check, color: Colors.grey),
                        label: Text(
                          'Full Name',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffB81736)),
                        ),
                      ),
                    ),
                    // Phone or Gmail TextField
                    TextField(
                      controller: _phoneOrEmailController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.check, color: Colors.grey),
                        label: Text(
                          'Phone or Gmail',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffB81736)),
                        ),
                      ),
                    ),
                    // Password TextField
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                        label: Text(
                          'Password',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffB81736)),
                        ),
                      ),
                    ),
                    // Confirm Password TextField
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                        label: Text(
                          'Confirm Password',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffB81736)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 70),
                    // Sign Up Button
                    GestureDetector(
                      onTap: _isLoading ? null : _signUp,
                      child: Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Color(0xffB81736), Color(0xff281537)],
                          ),
                        ),
                        child: Center(
                          child: _isLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                                  'SIGN UP',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    // Sign In Prompt
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/sign-in');
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
