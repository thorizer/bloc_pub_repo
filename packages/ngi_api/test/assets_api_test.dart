import 'package:ngi_api/ngi_api.export.dart';
import 'package:test/test.dart';

class TestAssetsApi extends AssetsApi {
  TestAssetsApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('AssetsApi', () {
    test('can be constructed', () {
      expect(TestAssetsApi.new, returnsNormally);
    });
  });
}
