// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginLogListHash() => r'ecf78b01b325a00687817d09769422b7a41a9836';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [loginLogList].
@ProviderFor(loginLogList)
const loginLogListProvider = LoginLogListFamily();

/// See also [loginLogList].
class LoginLogListFamily extends Family<AsyncValue<PageDataListModel?>> {
  /// See also [loginLogList].
  const LoginLogListFamily();

  /// See also [loginLogList].
  LoginLogListProvider call(
    LoginLogParams params,
  ) {
    return LoginLogListProvider(
      params,
    );
  }

  @override
  LoginLogListProvider getProviderOverride(
    covariant LoginLogListProvider provider,
  ) {
    return call(
      provider.params,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginLogListProvider';
}

/// See also [loginLogList].
class LoginLogListProvider
    extends AutoDisposeFutureProvider<PageDataListModel?> {
  /// See also [loginLogList].
  LoginLogListProvider(
    LoginLogParams params,
  ) : this._internal(
          (ref) => loginLogList(
            ref as LoginLogListRef,
            params,
          ),
          from: loginLogListProvider,
          name: r'loginLogListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginLogListHash,
          dependencies: LoginLogListFamily._dependencies,
          allTransitiveDependencies:
              LoginLogListFamily._allTransitiveDependencies,
          params: params,
        );

  LoginLogListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final LoginLogParams params;

  @override
  Override overrideWith(
    FutureOr<PageDataListModel?> Function(LoginLogListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginLogListProvider._internal(
        (ref) => create(ref as LoginLogListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PageDataListModel?> createElement() {
    return _LoginLogListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginLogListProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginLogListRef on AutoDisposeFutureProviderRef<PageDataListModel?> {
  /// The parameter `params` of this provider.
  LoginLogParams get params;
}

class _LoginLogListProviderElement
    extends AutoDisposeFutureProviderElement<PageDataListModel?>
    with LoginLogListRef {
  _LoginLogListProviderElement(super.provider);

  @override
  LoginLogParams get params => (origin as LoginLogListProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
