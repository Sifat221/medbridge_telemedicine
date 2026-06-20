enum ApiErrorType {
  none,
  unauthorized,
  network,
  timeout,
  server,
  parse,
  unknown,
}

class ApiResult<T> {
  final bool isSuccess;
  final T? data;
  final String message;
  final int? statusCode;
  final ApiErrorType errorType;

  const ApiResult._({
    required this.isSuccess,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errorType,
  });

  const ApiResult.success({
    required T data,
    String message = "Success",
    int? statusCode,
  }) : this._(
          isSuccess: true,
          data: data,
          message: message,
          statusCode: statusCode,
          errorType: ApiErrorType.none,
        );

  const ApiResult.failure({
    required String message,
    required ApiErrorType errorType,
    int? statusCode,
  }) : this._(
          isSuccess: false,
          data: null,
          message: message,
          statusCode: statusCode,
          errorType: errorType,
        );
}
