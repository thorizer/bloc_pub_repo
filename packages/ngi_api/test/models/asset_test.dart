// ignore_for_file: avoid_redundant_argument_values
import 'package:ngi_api/ngi_api.export.dart';
import 'package:test/test.dart';

void main() {
  group('Asset', () {
    Asset createSubject({
      String id = '1',
      String title = 'title',
      String description = 'description',
      bool isCompleted = true,
    }) {
      return Asset(
        id: id,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });

      test('throws AssertionError when id is empty', () {
        expect(
          () => createSubject(id: ''),
          throwsA(isA<AssertionError>()),
        );
      });

      test('sets id if not provided', () {
        expect(
          createSubject(id: '').id,
          isNotEmpty,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test('props are correct', () {
      expect(
        createSubject().props,
        equals([
          '1', // id
          'title', // title
          'description', // description
          true, // isCompleted
        ]),
      );
    });

    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(
            id: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            id: '2',
          ),
          equals(
            createSubject(
              id: '2',
              title: 'new title',
              description: 'new description',
              isCompleted: false,
            ),
          ),
        );
      });
    });

    group('fromJson', () {
      test('works correctly', () {
        expect(
          Asset.fromJson(<String, dynamic>{
            'id': '1',
            'title': 'title',
            'description': 'description',
            'isCompleted': true,
          }),
          equals(createSubject()),
        );
      });
    });

    group('toJson', () {
      test('works correctly', () {
        expect(
          createSubject().toJson(),
          equals(<String, dynamic>{
            'id': '1',
            'title': 'title',
            'description': 'description',
            'isCompleted': true,
          }),
        );
      });
    });
  });
}
