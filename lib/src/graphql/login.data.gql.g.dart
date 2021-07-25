// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GLoginData> _$gLoginDataSerializer = new _$GLoginDataSerializer();
Serializer<GLoginData_login> _$gLoginDataLoginSerializer =
    new _$GLoginData_loginSerializer();

class _$GLoginDataSerializer implements StructuredSerializer<GLoginData> {
  @override
  final Iterable<Type> types = const [GLoginData, _$GLoginData];
  @override
  final String wireName = 'GLoginData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GLoginData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.login;
    if (value != null) {
      result
        ..add('login')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GLoginData_login)));
    }
    return result;
  }

  @override
  GLoginData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'login':
          result.login.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GLoginData_login))!
              as GLoginData_login);
          break;
      }
    }

    return result.build();
  }
}

class _$GLoginData_loginSerializer
    implements StructuredSerializer<GLoginData_login> {
  @override
  final Iterable<Type> types = const [GLoginData_login, _$GLoginData_login];
  @override
  final String wireName = 'GLoginData_login';

  @override
  Iterable<Object?> serialize(Serializers serializers, GLoginData_login object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hasError',
      serializers.serialize(object.hasError,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.refreshToken;
    if (value != null) {
      result
        ..add('refreshToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.errorCode;
    if (value != null) {
      result
        ..add('errorCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.errorMessage;
    if (value != null) {
      result
        ..add('errorMessage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GLoginData_login deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginData_loginBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'refreshToken':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hasError':
          result.hasError = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'errorCode':
          result.errorCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'errorMessage':
          result.errorMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GLoginData extends GLoginData {
  @override
  final String G__typename;
  @override
  final GLoginData_login? login;

  factory _$GLoginData([void Function(GLoginDataBuilder)? updates]) =>
      (new GLoginDataBuilder()..update(updates)).build();

  _$GLoginData._({required this.G__typename, this.login}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoginData', 'G__typename');
  }

  @override
  GLoginData rebuild(void Function(GLoginDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginDataBuilder toBuilder() => new GLoginDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginData &&
        G__typename == other.G__typename &&
        login == other.login;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), login.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GLoginData')
          ..add('G__typename', G__typename)
          ..add('login', login))
        .toString();
  }
}

class GLoginDataBuilder implements Builder<GLoginData, GLoginDataBuilder> {
  _$GLoginData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GLoginData_loginBuilder? _login;
  GLoginData_loginBuilder get login =>
      _$this._login ??= new GLoginData_loginBuilder();
  set login(GLoginData_loginBuilder? login) => _$this._login = login;

  GLoginDataBuilder() {
    GLoginData._initializeBuilder(this);
  }

  GLoginDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _login = $v.login?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginData;
  }

  @override
  void update(void Function(GLoginDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoginData build() {
    _$GLoginData _$result;
    try {
      _$result = _$v ??
          new _$GLoginData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GLoginData', 'G__typename'),
              login: _login?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'login';
        _login?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GLoginData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLoginData_login extends GLoginData_login {
  @override
  final String G__typename;
  @override
  final String? token;
  @override
  final String? refreshToken;
  @override
  final bool hasError;
  @override
  final String? errorCode;
  @override
  final String? errorMessage;

  factory _$GLoginData_login(
          [void Function(GLoginData_loginBuilder)? updates]) =>
      (new GLoginData_loginBuilder()..update(updates)).build();

  _$GLoginData_login._(
      {required this.G__typename,
      this.token,
      this.refreshToken,
      required this.hasError,
      this.errorCode,
      this.errorMessage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoginData_login', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        hasError, 'GLoginData_login', 'hasError');
  }

  @override
  GLoginData_login rebuild(void Function(GLoginData_loginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginData_loginBuilder toBuilder() =>
      new GLoginData_loginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginData_login &&
        G__typename == other.G__typename &&
        token == other.token &&
        refreshToken == other.refreshToken &&
        hasError == other.hasError &&
        errorCode == other.errorCode &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, G__typename.hashCode), token.hashCode),
                    refreshToken.hashCode),
                hasError.hashCode),
            errorCode.hashCode),
        errorMessage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GLoginData_login')
          ..add('G__typename', G__typename)
          ..add('token', token)
          ..add('refreshToken', refreshToken)
          ..add('hasError', hasError)
          ..add('errorCode', errorCode)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class GLoginData_loginBuilder
    implements Builder<GLoginData_login, GLoginData_loginBuilder> {
  _$GLoginData_login? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  bool? _hasError;
  bool? get hasError => _$this._hasError;
  set hasError(bool? hasError) => _$this._hasError = hasError;

  String? _errorCode;
  String? get errorCode => _$this._errorCode;
  set errorCode(String? errorCode) => _$this._errorCode = errorCode;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  GLoginData_loginBuilder() {
    GLoginData_login._initializeBuilder(this);
  }

  GLoginData_loginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _token = $v.token;
      _refreshToken = $v.refreshToken;
      _hasError = $v.hasError;
      _errorCode = $v.errorCode;
      _errorMessage = $v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginData_login other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginData_login;
  }

  @override
  void update(void Function(GLoginData_loginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoginData_login build() {
    final _$result = _$v ??
        new _$GLoginData_login._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GLoginData_login', 'G__typename'),
            token: token,
            refreshToken: refreshToken,
            hasError: BuiltValueNullFieldError.checkNotNull(
                hasError, 'GLoginData_login', 'hasError'),
            errorCode: errorCode,
            errorMessage: errorMessage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
