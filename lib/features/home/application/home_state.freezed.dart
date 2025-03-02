// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Product>? get products => throw _privateConstructorUsedError;
  int get addedItemsCount => throw _privateConstructorUsedError;
  List<Product>? get addedItemsToCart => throw _privateConstructorUsedError;
  List<Product>? get favoriteItems => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    bool isLoading,
    List<Product>? products,
    int addedItemsCount,
    List<Product>? addedItemsToCart,
    List<Product>? favoriteItems,
    double totalAmount,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = freezed,
    Object? addedItemsCount = null,
    Object? addedItemsToCart = freezed,
    Object? favoriteItems = freezed,
    Object? totalAmount = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            products:
                freezed == products
                    ? _value.products
                    : products // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
            addedItemsCount:
                null == addedItemsCount
                    ? _value.addedItemsCount
                    : addedItemsCount // ignore: cast_nullable_to_non_nullable
                        as int,
            addedItemsToCart:
                freezed == addedItemsToCart
                    ? _value.addedItemsToCart
                    : addedItemsToCart // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
            favoriteItems:
                freezed == favoriteItems
                    ? _value.favoriteItems
                    : favoriteItems // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
            totalAmount:
                null == totalAmount
                    ? _value.totalAmount
                    : totalAmount // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    List<Product>? products,
    int addedItemsCount,
    List<Product>? addedItemsToCart,
    List<Product>? favoriteItems,
    double totalAmount,
  });
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = freezed,
    Object? addedItemsCount = null,
    Object? addedItemsToCart = freezed,
    Object? favoriteItems = freezed,
    Object? totalAmount = null,
  }) {
    return _then(
      _$HomeStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        products:
            freezed == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
        addedItemsCount:
            null == addedItemsCount
                ? _value.addedItemsCount
                : addedItemsCount // ignore: cast_nullable_to_non_nullable
                    as int,
        addedItemsToCart:
            freezed == addedItemsToCart
                ? _value._addedItemsToCart
                : addedItemsToCart // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
        favoriteItems:
            freezed == favoriteItems
                ? _value._favoriteItems
                : favoriteItems // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
        totalAmount:
            null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl({
    this.isLoading = false,
    final List<Product>? products = const [],
    this.addedItemsCount = 0,
    final List<Product>? addedItemsToCart = const [],
    final List<Product>? favoriteItems = const [],
    this.totalAmount = 0,
  }) : _products = products,
       _addedItemsToCart = addedItemsToCart,
       _favoriteItems = favoriteItems,
       super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<Product>? _products;
  @override
  @JsonKey()
  List<Product>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int addedItemsCount;
  final List<Product>? _addedItemsToCart;
  @override
  @JsonKey()
  List<Product>? get addedItemsToCart {
    final value = _addedItemsToCart;
    if (value == null) return null;
    if (_addedItemsToCart is EqualUnmodifiableListView)
      return _addedItemsToCart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Product>? _favoriteItems;
  @override
  @JsonKey()
  List<Product>? get favoriteItems {
    final value = _favoriteItems;
    if (value == null) return null;
    if (_favoriteItems is EqualUnmodifiableListView) return _favoriteItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final double totalAmount;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, products: $products, addedItemsCount: $addedItemsCount, addedItemsToCart: $addedItemsToCart, favoriteItems: $favoriteItems, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.addedItemsCount, addedItemsCount) ||
                other.addedItemsCount == addedItemsCount) &&
            const DeepCollectionEquality().equals(
              other._addedItemsToCart,
              _addedItemsToCart,
            ) &&
            const DeepCollectionEquality().equals(
              other._favoriteItems,
              _favoriteItems,
            ) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    const DeepCollectionEquality().hash(_products),
    addedItemsCount,
    const DeepCollectionEquality().hash(_addedItemsToCart),
    const DeepCollectionEquality().hash(_favoriteItems),
    totalAmount,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState({
    final bool isLoading,
    final List<Product>? products,
    final int addedItemsCount,
    final List<Product>? addedItemsToCart,
    final List<Product>? favoriteItems,
    final double totalAmount,
  }) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  bool get isLoading;
  @override
  List<Product>? get products;
  @override
  int get addedItemsCount;
  @override
  List<Product>? get addedItemsToCart;
  @override
  List<Product>? get favoriteItems;
  @override
  double get totalAmount;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
