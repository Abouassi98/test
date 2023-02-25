// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_color_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$RandomColorProviderHash() =>
    r'8daba1db46b256359d2ddbbfb8661be5465b8899';

/// random color provider
///
/// Copied from [RandomColorProvider].
final randomColorProviderProvider =
    AutoDisposeNotifierProvider<RandomColorProvider, Option<int>>(
  RandomColorProvider.new,
  name: r'randomColorProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$RandomColorProviderHash,
);
typedef RandomColorProviderRef = AutoDisposeNotifierProviderRef<Option<int>>;

abstract class _$RandomColorProvider extends AutoDisposeNotifier<Option<int>> {
  @override
  Option<int> build();
}

String _$newColorHash() => r'a0201f50b1f270d39a46e75b5fe27eafaf6438a9';

/// new color
///
/// Copied from [newColor].
final newColorProvider = AutoDisposeProvider<Option<int>>(
  newColor,
  name: r'newColorProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newColorHash,
);
typedef NewColorRef = AutoDisposeProviderRef<Option<int>>;
