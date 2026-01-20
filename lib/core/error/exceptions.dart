class ServerException implements Exception {
  final String message;
  final int statusCode;
  const ServerException({required this.message, required this.statusCode});
}

class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);
}

class CacheException implements Exception {
  final String message;
  const CacheException(this.message);
}

class ValidationException implements Exception {
  final String message;
  const ValidationException(this.message);
}

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);
}

class UnknownException implements Exception {
  final String message;
  const UnknownException(this.message);
}
