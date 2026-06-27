import '../../../../core/errors/app_error.dart';
import '../entities/farmer_entity.dart';
import '../repositories/auth_repository.dart';

/// Registers a farmer profile in the system.
final class RegisterFarmerUseCase {
  const RegisterFarmerUseCase({required AuthRepository repository})
      : _repository = repository;

  final AuthRepository _repository;

  Future<({FarmerEntity? farmer, AppError? error})> call({
    required FarmerEntity farmer,
  }) {
    if (farmer.fullName.trim().isEmpty) {
      return Future.value((
        farmer: null,
        error: const ValidationError(
          message: 'Full name is required.',
          field: 'fullName',
        ),
      ),);
    }
    if (farmer.province.isEmpty) {
      return Future.value((
        farmer: null,
        error: const ValidationError(
          message: 'Province is required.',
          field: 'province',
        ),
      ),);
    }
    if (farmer.farmType.isEmpty) {
      return Future.value((
        farmer: null,
        error: const ValidationError(
          message: 'Farm type is required.',
          field: 'farmType',
        ),
      ),);
    }
    return _repository.registerFarmer(farmer: farmer);
  }
}
