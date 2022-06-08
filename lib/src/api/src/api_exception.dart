class ApiBaseException implements Exception {
  final String? message;

  ApiBaseException(this.message);

  @override
  String toString() =>
      message ?? 'в ApiBaseException произошла ошибка, попробуйте ещё раз';
}

class RssNewsException extends ApiBaseException {
  RssNewsException([String? message]) : super(message);

  @override
  String toString() =>
      message ?? 'в RssNewsException Произошла ошибка, попробуйте ещё раз';
}
