import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundGrey,
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacing32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppTheme.borderGrey,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: AppTheme.veryLightGrey,
                ),
              ),
              const SizedBox(height: AppConstants.spacing24),
              const Text(
                'Profile Screen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: AppConstants.spacing8),
              const Text(
                'User profile and settings will be implemented here',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.secondaryText),
              ),
              const SizedBox(height: AppConstants.spacing32),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement auth functionality
                },
                child: const Text('Login / Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
