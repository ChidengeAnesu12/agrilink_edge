import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bridge/auth_bridge.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_farmer_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';

final authBridgeProvider = Provider<AuthBridge>(
  (_) => const AuthBridge(),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(bridge: ref.watch(authBridgeProvider)),
);

final sendOtpUseCaseProvider = Provider<SendOtpUseCase>(
  (ref) => SendOtpUseCase(repository: ref.watch(authRepositoryProvider)),
);

final verifyOtpUseCaseProvider = Provider<VerifyOtpUseCase>(
  (ref) => VerifyOtpUseCase(repository: ref.watch(authRepositoryProvider)),
);

final registerFarmerUseCaseProvider = Provider<RegisterFarmerUseCase>(
  (ref) => RegisterFarmerUseCase(
    repository: ref.watch(authRepositoryProvider),
  ),
);
