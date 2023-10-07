import 'package:tikto_app/src/domain/entities/user_firebase_entity.dart';
import 'package:tikto_app/src/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({required this.repository});

  Future<void> call(UserFirebaseEntity userFirebaseEntity) async {
    return await repository.getCreateCurrentUser(userFirebaseEntity);
  }
}
