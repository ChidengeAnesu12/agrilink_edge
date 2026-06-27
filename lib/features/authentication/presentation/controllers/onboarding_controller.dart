import 'package:flutter_riverpod/flutter_riverpod.dart';

final class OnboardingState {
  const OnboardingState({
    required this.currentPage,
    required this.totalPages,
  });

  final int currentPage;
  final int totalPages;

  bool get isLastPage => currentPage == totalPages - 1;
  bool get isFirstPage => currentPage == 0;

  OnboardingState copyWith({int? currentPage}) => OnboardingState(
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages,
      );
}

class OnboardingController extends Notifier<OnboardingState> {
  @override
  OnboardingState build() => const OnboardingState(
        currentPage: 0,
        totalPages: 7,
      );

  void goToPage(int page) => state = state.copyWith(currentPage: page);

  void nextPage() {
    if (!state.isLastPage) {
      state = state.copyWith(currentPage: state.currentPage + 1);
    }
  }

  void previousPage() {
    if (!state.isFirstPage) {
      state = state.copyWith(currentPage: state.currentPage - 1);
    }
  }
}

final onboardingControllerProvider =
    NotifierProvider<OnboardingController, OnboardingState>(
  OnboardingController.new,
);
