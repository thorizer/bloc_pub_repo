// ignore_for_file: public_member_api_docs

class ConnectionResult<E> {
  ConnectionResult(
    this._success, {
    E? data,
    Exception? ex,
    String? errorMessage,
  }) {
    _data = data ?? _data;
    _ex = ex ?? _ex;
    _errorMessage = errorMessage ?? _errorMessage;
  }
  final bool _success;
  bool get success => _success;

  Exception? _ex;
  Exception? get ex => _ex;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  E? _data;
  E? get data => _data;
}
