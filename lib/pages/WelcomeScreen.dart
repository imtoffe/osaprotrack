import 'package:flutter/material.dart';
import 'SignUp.dart'; // Importing the SignUp screen
import 'Login.dart'; // Importing the Login screen

// This is the WelcomeScreen widget
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity, // Fills the screen height
        width: double.infinity,  // Fills the screen width
        decoration: const BoxDecoration(
          // Adding a gradient background color
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 179, 11, 11), // Dark red
              Color.fromARGB(255, 110, 41, 59), // Deep pink
            ],
          ),
        ),
        child: Column(
          children: [
            // Padding for top spacing and adding a logo/image
            const Padding(
              padding: EdgeInsets.only(top: 200.0),
              child: Image(
                image: AssetImage('assets/ali.jpg'), // Path to the asset image
                width: 410, // Width of the image
                height: 210, // Height of the image
                fit: BoxFit.contain, // Adjusts image to fit within the container
              ),
            ),

            // Spacing between image and text
            const SizedBox(
              height: 100,
            ),

            // Welcome text section
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Centers the text
              children: [
                Text(
                  'Welcome to', // Welcome message
                  style: TextStyle(
                    fontSize: 28, // Font size
                    color: Colors.white, // Text color
                  ),
                ),
                Text(
                  'OSA Protrack', // Application name
                  style: TextStyle(
                    fontSize: 32, // Font size
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold, // Bold text style
                    fontStyle: FontStyle.italic, // Italic text style
                  ),
                ),
              ],
            ),

            // Spacing between text and Sign In button
            const SizedBox(
              height: 30,
            ),

            // Sign In button using GestureDetector for tap handling
            GestureDetector(
              onTap: () {
                // Navigating to the login screen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const loginScreen()),
                );
              },
              child: Container(
                height: 53, // Button height
                width: 320, // Button width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                  border: Border.all(color: Colors.white), // White border
                ),
                child: const Center(
                  child: Text(
                    'LOG IN', // Button text
                    style: TextStyle(
                      fontSize: 20, // Font size
                      fontWeight: FontWeight.bold, // Bold text
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
            ),

            // Spacing between Sign In and Sign Up buttons
            const SizedBox(
              height: 30,
            ),

            // Sign Up button using GestureDetector for tap handling
            GestureDetector(
              onTap: () {
                // Navigating to the sign-up screen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegScreen()),
                );
              },
              child: Container(
                height: 53, // Button height
                width: 320, // Button width
                decoration: BoxDecoration(
                  color: Colors.white, // Button background color
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                  border: Border.all(color: Colors.white), // White border
                ),
                child: const Center(
                  child: Text(
                    'SIGN UP', // Button text
                    style: TextStyle(
                      fontSize: 20, // Font size
                      fontWeight: FontWeight.bold, // Bold text
                      color: Colors.black, // Text color
                    ),
                  ),
                ),
              ),
            ),

            // Spacer to push content upwards and avoid overflow
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
