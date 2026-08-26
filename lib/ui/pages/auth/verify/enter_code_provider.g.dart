// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enter_code_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EnterCode)
const enterCodeProvider = EnterCodeProvider._();

final class EnterCodeProvider
    extends $NotifierProvider<EnterCode, EnterCodeState> {
  const EnterCodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enterCodeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enterCodeHash();

  @$internal
  @override
  EnterCode create() => EnterCode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EnterCodeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EnterCodeState>(value),
    );
  }
}

String _$enterCodeHash() => r'e7372efcdf907bac754d4d63db30edd2f9b30bc9';

abstract class _$EnterCode extends $Notifier<EnterCodeState> {
  EnterCodeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<EnterCodeState, EnterCodeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EnterCodeState, EnterCodeState>,
              EnterCodeState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
