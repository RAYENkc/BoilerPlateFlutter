import 'package:BolilerPlate/core/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockDioTest extends Mock implements Dio {}

void main() {
  test('Given user with age of 24 When birthday is called then user is old ...',
      () async {

    // ARRANGE
    final mockDio = MockDioTest();
    when(mockDio.get(' ')).thenAnswer((invocation) => Future.value());
    
    final user = UserModel("SomeName", "", "", "", "", 24,mockDio );

    //ACT
    user.birthday();

    // ASSERT
    expect(user.age, 25);
  });
}
