# SepaTWO - Elegant Monochrome Shoe E-commerce App

SepaTWO adalah aplikasi e-commerce sepatu dengan desain monokrom yang elegan, dibangun menggunakan Flutter dengan arsitektur clean code dan state management Riverpod.

## 🎯 Fitur Utama

### ✅ Fitur yang Sudah Diimplementasi
- **Home Screen**: Tampilan utama dengan produk unggulan dan kategori
- **Product Display**: Grid view produk dengan informasi lengkap
- **Shopping Cart**: Keranjang belanja dengan perhitungan otomatis
- **Add to Cart**: Dialog pemilihan ukuran dan warna sebelum menambah ke keranjang
- **Quantity Management**: Mengubah jumlah item dalam keranjang
- **Price Calculation**: Perhitungan subtotal, diskon, dan total
- **Responsive Design**: Layout yang responsif dan elegan
- **State Management**: Menggunakan Riverpod untuk state management
- **Theme System**: Tema monokrom yang konsisten dan elegan

### 🚧 Fitur yang Akan Dikembangkan
- **Search & Filter**: Pencarian dan filter produk berdasarkan kategori, brand, harga
- **Product Detail**: Halaman detail produk dengan galeri gambar dan review
- **User Authentication**: Login, register, dan manajemen akun pengguna
- **Checkout Process**: Proses checkout dengan integrasi payment gateway
- **Order Management**: Tracking pesanan dan riwayat pembelian
- **Wishlist**: Daftar keinginan produk
- **User Reviews**: Sistem review dan rating produk
- **Address Management**: Manajemen alamat pengiriman
- **Push Notifications**: Notifikasi untuk promo dan status pesanan

## 🏗️ Arsitektur

Aplikasi ini menggunakan **Clean Architecture** dengan struktur sebagai berikut:

```
lib/
├── core/                    # Core functionality
│   ├── constants/          # App constants
│   ├── theme/             # App theme and styling
│   ├── utils/             # Utility functions
│   ├── error/             # Error handling
│   ├── network/           # Network configuration (Dio)
│   └── navigation/        # Navigation setup
├── features/               # Feature modules
│   ├── auth/              # Authentication
│   ├── home/              # Home screen
│   ├── product/           # Product management
│   ├── cart/              # Shopping cart
│   ├── profile/           # User profile
│   └── order/             # Order management
└── shared/                # Shared components
    ├── widgets/           # Reusable widgets
    ├── providers/         # Riverpod providers
    └── models/            # Data models
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.7.2+
- **State Management**: Riverpod 2.4.10
- **HTTP Client**: Dio 5.4.1
- **Code Generation**: Freezed, json_serializable
- **Backend**: Supabase (planned)
- **Database**: PostgreSQL via Supabase
- **UI/UX**: Material Design 3 dengan custom theme monokrom

## 📦 Dependencies

### Main Dependencies
```yaml
flutter_riverpod: ^2.4.10      # State management
dio: ^5.4.1                    # HTTP client
freezed_annotation: ^2.4.1     # Code generation
google_fonts: ^6.2.1          # Typography
cached_network_image: ^3.3.1   # Image caching
intl: ^0.19.0                  # Internationalization
uuid: ^4.4.0                   # UUID generation
```

### UI Dependencies
```yaml
flutter_svg: ^2.0.10+1        # SVG support
smooth_page_indicator: ^1.1.0  # Page indicators
flutter_rating_bar: ^4.0.1     # Rating display
shimmer: ^3.0.0                # Loading effects
```

## 🎨 Design System

### Color Palette (Monochrome)
- **Primary Black**: #000000
- **Primary White**: #FFFFFF
- **Dark Grey**: #1A1A1A
- **Medium Grey**: #333333
- **Light Grey**: #666666
- **Very Light Grey**: #9E9E9E
- **Background Grey**: #F5F5F5
- **Border Grey**: #E0E0E0

### Typography
- **Font Family**: Inter (Google Fonts)
- **Weights**: Regular (400), Medium (500), SemiBold (600), Bold (700)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.7.2 atau lebih baru
- Dart SDK 3.0.0 atau lebih baru
- Android Studio / VS Code dengan Flutter extension
- Git

### Installation

1. **Clone repository**
   ```bash
   git clone https://github.com/yourusername/sepatwo.git
   cd sepatwo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (Freezed, JSON Serializable)**
   ```bash
   dart run build_runner build
   ```

4. **Run application**
   ```bash
   flutter run
   ```

### Setup Backend (Supabase)

1. Create account di [Supabase](https://supabase.com)
2. Create new project
3. Update `baseUrl` di `lib/core/constants/app_constants.dart`
4. Setup database schema (akan ditambahkan)

## 📱 Screenshots

(Screenshots akan ditambahkan setelah UI selesai)

## 🔧 Development

### Code Generation
Aplikasi menggunakan code generation untuk model dan provider:

```bash
# Generate files
dart run build_runner build

# Watch for changes
dart run build_runner watch

# Clean and regenerate
dart run build_runner build --delete-conflicting-outputs
```

### Adding New Features

1. **Model**: Create di `lib/shared/models/`
2. **Provider**: Create di `lib/shared/providers/`
3. **Widget**: Create di `lib/shared/widgets/` atau feature folder
4. **Screen**: Create di `lib/features/[feature_name]/`

### State Management dengan Riverpod

```dart
// Provider
final productProvider = StateNotifierProvider<ProductNotifier, AsyncValue<List<Product>>>((ref) {
  return ProductNotifier();
});

// Consumer Widget
class ProductScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    
    return products.when(
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
      data: (products) => ListView.builder(...),
    );
  }
}
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Generate coverage report
genhtml coverage/lcov.info -o coverage/html
```

## 📈 Performance

- **Lazy loading** untuk list produk
- **Image caching** dengan CachedNetworkImage
- **State optimization** dengan Riverpod
- **Code splitting** berdasarkan fitur

## 🤝 Contributing

1. Fork repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

Developed with ❤️ for learning purposes

## 📞 Support

Jika ada pertanyaan atau masalah, silakan buat issue di repository ini.

---

**SepaTWO** - Elegant monochrome shoe e-commerce experience
