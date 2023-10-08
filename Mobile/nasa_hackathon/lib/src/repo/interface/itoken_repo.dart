abstract interface class ITokenRepo {
  Future<String?> fetchToken();
  Future<void> saveToken(String token);
  Future<void> clear();
}
