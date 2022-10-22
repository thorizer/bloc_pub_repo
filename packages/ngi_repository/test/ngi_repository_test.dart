// ignore_for_file: prefer_const_constructors, lines_longer_than_80_chars, unused_local_variable
import 'package:ngi_repository/ngi_repository.dart';
import 'package:test/test.dart';

void main() {
  group('AssetsRepository', () {
    late AssetsApi api;

    final assets = [
      Asset(
        id: '1',
      ),
      Asset(
        id: '2',
      ),
      Asset(
        id: '3',
      ),
    ];

    setUpAll(() {
    });

    setUp(() {
     /*  when(() => api.getAssets('')).thenAnswer((_) => Future.value(assets));
      when(() => api.saveAsset(any())).thenAnswer((_) async {});
      when(() => api.deleteAsset(any())).thenAnswer((_) async {});
      when(
        () => api.clearCompleted(),
      ).thenAnswer((_) async => assets.where((asset) => true).length);
      when(
        () => api.completeAll(isCompleted: any(named: 'isCompleted')),
      ).thenAnswer((_) async => 0); */
    });

    AuthenticationRepository createSubject() => AuthenticationRepository();

    group('constructor', () {
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('getAssets', () {
      test('makes correct api request', () {
        final subject = createSubject();

        expect(
          subject.logIn(password: 'password', username: 'username'),
          isNot(throwsA(anything)),
        );

        // verify(() => api.getAssets(<String,dynamic>{}).called(1);
      });

      test('returns stream of current list assets', () {
        expect(
          createSubject().logOut(),
          emits(assets),
        );
      });
    });

    group('saveAsset', () {
      test('makes correct api request', () {
        final newAsset = Asset(
          id: '4',
        );

        final subject = createSubject();

        //expect(subject.saveAsset(newAsset), completes);

        //verify(() => api.saveAsset(newAsset)).called(1);
      });
    });

    /* group('deleteAsset', () {
      test('makes correct api request', () {
        final subject = createSubject();

        expect(subject.deleteAsset(assets[0].id), completes);

        verify(() => api.deleteAsset(assets[0].id)).called(1);
      });
    }); */

    group('clearCompleted', () {
      test('makes correct request', () {
        final subject = createSubject();

        //expect(subject.clearCompleted(), completes);

        //verify(() => api.clearCompleted()).called(1);
      });
    });

    group('completeAll', () {
      test('makes correct request', () {
        final subject = createSubject();

        //expect(subject.completeAll(isCompleted: true), completes);

        //verify(() => api.completeAll(isCompleted: true)).called(1);
      });
    });
  });
}
