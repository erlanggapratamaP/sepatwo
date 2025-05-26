import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundGrey,
      appBar: AppBar(title: const Text('Search')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacing32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search, size: 120, color: AppTheme.veryLightGrey),
              const SizedBox(height: AppConstants.spacing24),
              const Text(
                'Search Screen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: AppConstants.spacing8),
              const Text(
                'Search and filter functionality will be implemented here',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.secondaryText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
