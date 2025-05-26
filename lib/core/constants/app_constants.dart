class AppConstants {
  // App Info
  static const String appName = 'SepaTWO';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Elegant monochrome shoe e-commerce app';

  // API Constants
  static const String baseUrl = 'https://your-supabase-url.supabase.co';
  static const String apiVersion = 'v1';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String userDataKey = 'user_data';
  static const String cartKey = 'cart_items';
  static const String wishlistKey = 'wishlist_items';
  static const String onboardingKey = 'onboarding_completed';

  // Pagination
  static const int pageSize = 20;
  static const int maxRetries = 3;

  // Shoe Categories
  static const List<String> shoeCategories = [
    'Sneakers',
    'Formal',
    'Casual',
    'Sports',
    'Boots',
    'Sandals',
    'Loafers',
    'High Heels',
  ];

  // Shoe Brands
  static const List<String> shoeBrands = [
    'Nike',
    'Adidas',
    'Puma',
    'Converse',
    'Vans',
    'New Balance',
    'Reebok',
    'ASICS',
    'Jordan',
    'Under Armour',
  ];

  // Shoe Sizes
  static const List<String> shoeSizes = [
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
  ];

  // Colors (Monochrome)
  static const List<String> shoeColors = [
    'Black',
    'White',
    'Grey',
    'Dark Grey',
    'Light Grey',
  ];

  // Default Images
  static const String defaultProductImage = 'assets/images/default_product.png';
  static const String defaultUserAvatar = 'assets/images/default_avatar.png';
  static const String logoImage = 'assets/images/logo.png';
  static const String noDataImage = 'assets/images/no_data.svg';
  static const String emptyCartImage = 'assets/images/empty_cart.svg';
  static const String noInternetImage = 'assets/images/no_internet.svg';

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Spacing
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing48 = 48.0;
  static const double spacing64 = 64.0;

  // Border Radius
  static const double borderRadius4 = 4.0;
  static const double borderRadius8 = 8.0;
  static const double borderRadius12 = 12.0;
  static const double borderRadius16 = 16.0;
  static const double borderRadius24 = 24.0;

  // Icon Sizes
  static const double iconSize16 = 16.0;
  static const double iconSize20 = 20.0;
  static const double iconSize24 = 24.0;
  static const double iconSize32 = 32.0;
  static const double iconSize48 = 48.0;

  // Payment Methods
  static const List<String> paymentMethods = [
    'Credit Card',
    'Debit Card',
    'Bank Transfer',
    'E-Wallet',
    'Cash on Delivery',
  ];

  // Order Status
  static const String orderPending = 'pending';
  static const String orderConfirmed = 'confirmed';
  static const String orderProcessing = 'processing';
  static const String orderShipped = 'shipped';
  static const String orderDelivered = 'delivered';
  static const String orderCancelled = 'cancelled';

  // Error Messages
  static const String networkError = 'Network connection error';
  static const String unknownError = 'Unknown error occurred';
  static const String validationError = 'Validation error';
  static const String authError = 'Authentication error';
  static const String permissionError = 'Permission denied';

  // Success Messages
  static const String loginSuccess = 'Login successful';
  static const String registerSuccess = 'Registration successful';
  static const String updateSuccess = 'Update successful';
  static const String deleteSuccess = 'Delete successful';
  static const String addToCartSuccess = 'Added to cart';
  static const String removeFromCartSuccess = 'Removed from cart';
}
