import 'package:food_drink_delivery/router/route_config.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding_provider.g.dart';

@riverpod
class Onboarding extends _$Onboarding{
  @override
  int build(){
    return 0;
  }

  void next(GoRouter router){
    if(state < 3){
      state++;
    }
    if(state == 3){
      router.pushReplacementNamed(RouteConfig.login);
    }
  }

  void previous(){
    if(state > 0){
      state--;
    }
  }
}