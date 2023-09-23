class AppException implements Exception {
  final _msg;
  final _prefix;

  AppException(this._msg, this._prefix);

  @override
  String toString() {
    return '$_prefix$_msg';
  }
}

class InternetException extends AppException {
  InternetException([String? msg]) : super(msg, "");
}

class RequestTimeout extends AppException {
  RequestTimeout([String? msg]) : super(msg, "");
}

class ServerException extends AppException {
  ServerException([String? msg]) : super(msg, "");
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? msg]) : super(msg, "");
}

class FetchDataException extends AppException {
  FetchDataException([String? msg]) : super(msg, "");
}
