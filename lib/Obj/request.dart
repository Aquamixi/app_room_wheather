class Request {
  final String temperature;

  const Request({
    required this.temperature,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'temperature': String temperature,
      } =>
        Request(
          temperature: temperature,
        ),
      _ => throw const FormatException('Failed to load'),
    };
  }
}