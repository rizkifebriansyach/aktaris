class ApiResponse<T> {
  final bool success;
  final String? message;
  final String? error;
  final T? data;

  ApiResponse({
    required this.success,
    required this.message,
    this.error,
    this.data,
  });

  factory ApiResponse.fromJson(Map<dynamic, dynamic> json) {
    // late bool isErrorNotEmpty;
    // if (json['error'] is List) {
    //   isErrorNotEmpty = (json['error'] as List).isNotEmpty;
    // } else {
    //   isErrorNotEmpty = json['error'] != null;
    // }

    return ApiResponse(
      success: json['success'],
      error: (json['error'] != null) ? json['error'] : null,
      data: (json['data'] != null) ? json['data'] : null,
      message: (json['message'] != null) ? json['message'] : null,
    );
  }
}
