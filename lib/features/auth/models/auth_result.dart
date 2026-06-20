enum AuthErrorType {
  none,
  invalidCredentials,
  network,
  server,
  unknown,
}

class AuthResult {
  final bool isSuccess;
  final String message;
  final AuthErrorType errorType;

  const AuthResult._({
    required this.isSuccess,
    required this.message,
    required this.errorType,
  });

  const AuthResult.success({
    String message = "Login successful",
  }) : this._(
          isSuccess: true,
          message: message,
          errorType: AuthErrorType.none,
        );

  const AuthResult.failure({
    required String message,
    required AuthErrorType errorType,
  }) : this._(
          isSuccess: false,
          message: message,
          errorType: errorType,
        );
}
