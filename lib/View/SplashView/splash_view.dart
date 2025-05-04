import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'dart:async';

import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Create fade-in animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeInOut),
      ),
    );

    // Create scale animation
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeInOut),
      ),
    );

    // Start animation
    _animationController.forward();

    // Navigate to home screen after delay
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, RouteNames.loginView),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Using AppColor class for gradient colors
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColor.primaryColor,
              AppColor.mediumPurple,
              AppColor.lightPurple,
            ],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: context.mw * 0.3,
                        height: context.mw * 0.3,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 25,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Document shape
                              Container(
                                width: context.mw * 0.3,
                                height: context.mw * 0.3,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Positioned(
                                top: context.mh * 0.05,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    0.01.ph(context),
                                    Container(
                                      width: 60,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    0.01.ph(context),
                                    Container(
                                      width: 60,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 15,
                                left: 20,
                                child: Icon(
                                  Icons.bolt,
                                  size: 30,
                                  color: AppColor.mediumPurple,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      0.03.ph(context),
                      Text(
                        'ZapDocs',
                        style: TextStyle(
                          fontSize: context.mh * 0.03,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      0.01.ph(context),
                      Text(
                        'Instant Document Summaries',
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          color: AppColor.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.5,
                        ),
                      ),
                      0.03.ph(context),
                      // Loading indicator
                      SizedBox(
                        width: context.mw * 0.05,
                        height: context.mw * 0.05,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColor.white),
                          strokeWidth: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
