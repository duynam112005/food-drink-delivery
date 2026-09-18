import 'package:flutter/material.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/ui/pages/onboarding/onboarding_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding_provider.g.dart';

@riverpod
class Onboarding extends _$Onboarding{
  @override
  OnboardingState build(){
    return OnboardingState();
  }

  void changeIndex(int index, BuildContext context, WidgetRef ref){
    state = state.copyWith(currentIndex: index);
    final currentIndex = ref.read(onboardingProvider).currentIndex;
    if(currentIndex == 3){
      context.pushReplacementNamed(RouteConfig.login);
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:food_drink_delivery/di/injection.dart';
// import 'package:food_drink_delivery/router/route_config.dart';
// import 'package:food_drink_delivery/storage/secure_storage.dart';
// import 'package:food_drink_delivery/ui/pages/onboarding/onboarding_state.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'onboarding_provider.g.dart';

// @riverpod
// class Onboarding extends _$Onboarding {
//   @override
//   OnboardingState build() {
//     return OnboardingState();
//   }

//   Future<void> changeIndex(int index, BuildContext context, WidgetRef ref) async {
//     state = state.copyWith(currentIndex: index);
//     final currentIndex = ref.read(onboardingProvider).currentIndex;
//     if (currentIndex == 3) {
//       final storage = sl<SecureStorage>();
//       await storage.write('hasSeenOnboarding', 'true');
//       if (context.mounted) {
//         context.pushReplacementNamed(RouteConfig.login);
//       }
//     }
//   }
// }

