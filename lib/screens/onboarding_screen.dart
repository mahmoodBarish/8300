import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        // Set status bar icons to light (white) for visibility against dark background/gradient
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            // Onboarding Image (ID: 142:499, I142:500;417:719)
            // Occupies the top portion of the screen
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              // Height from Figma's 'Image Onboarding' frame (536) / total screen height (812)
              height: screenHeight * (536 / 812),
              child: Image.asset(
                'assets/images/I142_500_417_719.png',
                fit: BoxFit.cover, // Ensures the image covers the area, handling clipping
              ),
            ),

            // Bottom Content Container (ID: 142:501)
            // Starts at y=452, extends to the bottom of the screen
            Positioned(
              top: screenHeight * (452 / 812), // Start position from Figma
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  // Gradient for 'Shadow Container' (ID: 142:502)
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      // Figma color: r: 0.0196, g: 0.0196, b: 0.0196, a: 0
                      const Color.fromRGBO(5, 5, 5, 0),
                      // Figma color: r: 0.0196, g: 0.0196, b: 0.0196, a: 1
                      const Color.fromRGBO(5, 5, 5, 1),
                    ],
                    stops: const [0.0, 0.2367], // Gradient stops from Figma
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * (24 / 375), // Horizontal padding 24 from Figma
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Space from top of gradient container (y=452) to text (y=476)
                      SizedBox(height: screenHeight * (24 / 812)),

                      // Main Title Text (ID: 142:506)
                      Text(
                        'Fall in Love with Coffee in Blissful Delight!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                          fontSize: 32,
                          fontWeight: FontWeight.w600, // SemiBold
                          color: Colors.white,
                          height: 1.5, // Line height 48px / font size 32px
                          letterSpacing: 0.16,
                        ),
                      ),
                      SizedBox(height: screenHeight * (8 / 812)), // Item spacing 8 from Figma

                      // Subtitle Text (ID: 142:507)
                      Text(
                        'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                          fontSize: 14,
                          fontWeight: FontWeight.w400, // Regular
                          color: const Color(0xFFA2A2A2), // Figma color: r: 0.635, g: 0.635, b: 0.635
                          height: 1.5, // Line height 21px / font size 14px
                          letterSpacing: 0.14,
                        ),
                      ),

                      const Spacer(), // Pushes the button to the bottom while respecting other spacings

                      // Get Started Button (ID: 142:503)
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the home screen
                          context.go('/home');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            screenWidth - (screenWidth * (24 / 375) * 2), // Full width minus horizontal padding
                            screenHeight * (56 / 812), // Height 56 from Figma
                          ),
                          backgroundColor: const Color(0xFFC67C4E), // Figma color: r: 0.776, g: 0.486, b: 0.305
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16), // Corner radius 16 from Figma
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * (16 / 812), // Padding top/bottom 16
                            horizontal: screenWidth * (20 / 375), // Padding left/right 20
                          ),
                        ),
                        child: Text(
                          'Get Started', // Text 'Get Started' (ID: 142:504)
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600, // SemiBold
                            color: Colors.white,
                            height: 1.5, // Line height 24px / font size 16px
                          ),
                        ),
                      ),
                      // Space below the button (812 - (702+56) = 54px)
                      SizedBox(height: screenHeight * (54 / 812)),
                    ],
                  ),
                ),
              ),
            ),

            // Home Indicator (ID: 142:508)
            // Positioned at the bottom of the screen
            Positioned(
              bottom: screenHeight * (13 / 812), // 13px from bottom (812-799)
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: screenWidth * (134 / 375), // Width 134 from Figma
                  height: 5, // Height 5 from Figma
                  decoration: BoxDecoration(
                    // Figma color: r: 0.141, g: 0.141, b: 0.141, a: 1
                    color: const Color(0xFF232323),
                    borderRadius: BorderRadius.circular(100), // Rounded corners from Figma
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}