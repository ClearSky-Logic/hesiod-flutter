class ApiResponse<T> {
  final int statusCode;
  dynamic content;
  String message;
  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  ApiResponse(this.statusCode, {this.content, required this.message});
}
