import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  const HomeState({this.clickbaitFeatureEnabled = false});

  final bool? clickbaitFeatureEnabled;

  HomeState copyWith({
    bool? clickbaitFeatureEnabled,
  }) =>
      HomeState(
        clickbaitFeatureEnabled:
            clickbaitFeatureEnabled ?? this.clickbaitFeatureEnabled,
      );
}

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

  void toggleClickbaitFeature(bool? newValue) {
    state = state.copyWith(clickbaitFeatureEnabled: newValue);
  }
}

final homeNotifierProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(),
);
