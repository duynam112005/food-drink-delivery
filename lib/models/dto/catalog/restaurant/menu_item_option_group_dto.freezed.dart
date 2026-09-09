// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_option_group_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuItemOptionGroupDTO {

 String get id; String get name; String get type; bool get isRequired; int get minSelect; int get maxSelect; List<MenuItemOptionDTO> get values;
/// Create a copy of MenuItemOptionGroupDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemOptionGroupDTOCopyWith<MenuItemOptionGroupDTO> get copyWith => _$MenuItemOptionGroupDTOCopyWithImpl<MenuItemOptionGroupDTO>(this as MenuItemOptionGroupDTO, _$identity);

  /// Serializes this MenuItemOptionGroupDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItemOptionGroupDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.minSelect, minSelect) || other.minSelect == minSelect)&&(identical(other.maxSelect, maxSelect) || other.maxSelect == maxSelect)&&const DeepCollectionEquality().equals(other.values, values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,minSelect,maxSelect,const DeepCollectionEquality().hash(values));

@override
String toString() {
  return 'MenuItemOptionGroupDTO(id: $id, name: $name, type: $type, isRequired: $isRequired, minSelect: $minSelect, maxSelect: $maxSelect, values: $values)';
}


}

/// @nodoc
abstract mixin class $MenuItemOptionGroupDTOCopyWith<$Res>  {
  factory $MenuItemOptionGroupDTOCopyWith(MenuItemOptionGroupDTO value, $Res Function(MenuItemOptionGroupDTO) _then) = _$MenuItemOptionGroupDTOCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, bool isRequired, int minSelect, int maxSelect, List<MenuItemOptionDTO> values
});




}
/// @nodoc
class _$MenuItemOptionGroupDTOCopyWithImpl<$Res>
    implements $MenuItemOptionGroupDTOCopyWith<$Res> {
  _$MenuItemOptionGroupDTOCopyWithImpl(this._self, this._then);

  final MenuItemOptionGroupDTO _self;
  final $Res Function(MenuItemOptionGroupDTO) _then;

/// Create a copy of MenuItemOptionGroupDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? minSelect = null,Object? maxSelect = null,Object? values = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,minSelect: null == minSelect ? _self.minSelect : minSelect // ignore: cast_nullable_to_non_nullable
as int,maxSelect: null == maxSelect ? _self.maxSelect : maxSelect // ignore: cast_nullable_to_non_nullable
as int,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<MenuItemOptionDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItemOptionGroupDTO].
extension MenuItemOptionGroupDTOPatterns on MenuItemOptionGroupDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItemOptionGroupDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItemOptionGroupDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItemOptionGroupDTO value)  $default,){
final _that = this;
switch (_that) {
case _MenuItemOptionGroupDTO():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItemOptionGroupDTO value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItemOptionGroupDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  int minSelect,  int maxSelect,  List<MenuItemOptionDTO> values)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItemOptionGroupDTO() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.minSelect,_that.maxSelect,_that.values);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  int minSelect,  int maxSelect,  List<MenuItemOptionDTO> values)  $default,) {final _that = this;
switch (_that) {
case _MenuItemOptionGroupDTO():
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.minSelect,_that.maxSelect,_that.values);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  bool isRequired,  int minSelect,  int maxSelect,  List<MenuItemOptionDTO> values)?  $default,) {final _that = this;
switch (_that) {
case _MenuItemOptionGroupDTO() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.minSelect,_that.maxSelect,_that.values);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItemOptionGroupDTO implements MenuItemOptionGroupDTO {
  const _MenuItemOptionGroupDTO({required this.id, required this.name, required this.type, required this.isRequired, required this.minSelect, required this.maxSelect, required final  List<MenuItemOptionDTO> values}): _values = values;
  factory _MenuItemOptionGroupDTO.fromJson(Map<String, dynamic> json) => _$MenuItemOptionGroupDTOFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
@override final  bool isRequired;
@override final  int minSelect;
@override final  int maxSelect;
 final  List<MenuItemOptionDTO> _values;
@override List<MenuItemOptionDTO> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}


/// Create a copy of MenuItemOptionGroupDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemOptionGroupDTOCopyWith<_MenuItemOptionGroupDTO> get copyWith => __$MenuItemOptionGroupDTOCopyWithImpl<_MenuItemOptionGroupDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemOptionGroupDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItemOptionGroupDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.minSelect, minSelect) || other.minSelect == minSelect)&&(identical(other.maxSelect, maxSelect) || other.maxSelect == maxSelect)&&const DeepCollectionEquality().equals(other._values, _values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,minSelect,maxSelect,const DeepCollectionEquality().hash(_values));

@override
String toString() {
  return 'MenuItemOptionGroupDTO(id: $id, name: $name, type: $type, isRequired: $isRequired, minSelect: $minSelect, maxSelect: $maxSelect, values: $values)';
}


}

/// @nodoc
abstract mixin class _$MenuItemOptionGroupDTOCopyWith<$Res> implements $MenuItemOptionGroupDTOCopyWith<$Res> {
  factory _$MenuItemOptionGroupDTOCopyWith(_MenuItemOptionGroupDTO value, $Res Function(_MenuItemOptionGroupDTO) _then) = __$MenuItemOptionGroupDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, bool isRequired, int minSelect, int maxSelect, List<MenuItemOptionDTO> values
});




}
/// @nodoc
class __$MenuItemOptionGroupDTOCopyWithImpl<$Res>
    implements _$MenuItemOptionGroupDTOCopyWith<$Res> {
  __$MenuItemOptionGroupDTOCopyWithImpl(this._self, this._then);

  final _MenuItemOptionGroupDTO _self;
  final $Res Function(_MenuItemOptionGroupDTO) _then;

/// Create a copy of MenuItemOptionGroupDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? minSelect = null,Object? maxSelect = null,Object? values = null,}) {
  return _then(_MenuItemOptionGroupDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,minSelect: null == minSelect ? _self.minSelect : minSelect // ignore: cast_nullable_to_non_nullable
as int,maxSelect: null == maxSelect ? _self.maxSelect : maxSelect // ignore: cast_nullable_to_non_nullable
as int,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<MenuItemOptionDTO>,
  ));
}


}

// dart format on
