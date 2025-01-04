class Request {
  final String message;

  const Request({
    required this.message,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'message': String message,
      } =>
        Request(
          message: message,
        ),
      _ => throw const FormatException('Failed to load'),
    };
  }
}