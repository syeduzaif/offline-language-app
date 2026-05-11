// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LanguagesTable extends Languages
    with TableInfo<$LanguagesTable, Language> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LanguagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _englishNameMeta = const VerificationMeta(
    'englishName',
  );
  @override
  late final GeneratedColumn<String> englishName = GeneratedColumn<String>(
    'english_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nativeNameMeta = const VerificationMeta(
    'nativeName',
  );
  @override
  late final GeneratedColumn<String> nativeName = GeneratedColumn<String>(
    'native_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _flagMeta = const VerificationMeta('flag');
  @override
  late final GeneratedColumn<String> flag = GeneratedColumn<String>(
    'flag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [code, englishName, nativeName, flag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'languages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Language> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('english_name')) {
      context.handle(
        _englishNameMeta,
        englishName.isAcceptableOrUnknown(
          data['english_name']!,
          _englishNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_englishNameMeta);
    }
    if (data.containsKey('native_name')) {
      context.handle(
        _nativeNameMeta,
        nativeName.isAcceptableOrUnknown(data['native_name']!, _nativeNameMeta),
      );
    } else if (isInserting) {
      context.missing(_nativeNameMeta);
    }
    if (data.containsKey('flag')) {
      context.handle(
        _flagMeta,
        flag.isAcceptableOrUnknown(data['flag']!, _flagMeta),
      );
    } else if (isInserting) {
      context.missing(_flagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Language map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Language(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      englishName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english_name'],
      )!,
      nativeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}native_name'],
      )!,
      flag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flag'],
      )!,
    );
  }

  @override
  $LanguagesTable createAlias(String alias) {
    return $LanguagesTable(attachedDatabase, alias);
  }
}

class Language extends DataClass implements Insertable<Language> {
  final String code;
  final String englishName;
  final String nativeName;
  final String flag;
  const Language({
    required this.code,
    required this.englishName,
    required this.nativeName,
    required this.flag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['english_name'] = Variable<String>(englishName);
    map['native_name'] = Variable<String>(nativeName);
    map['flag'] = Variable<String>(flag);
    return map;
  }

  LanguagesCompanion toCompanion(bool nullToAbsent) {
    return LanguagesCompanion(
      code: Value(code),
      englishName: Value(englishName),
      nativeName: Value(nativeName),
      flag: Value(flag),
    );
  }

  factory Language.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Language(
      code: serializer.fromJson<String>(json['code']),
      englishName: serializer.fromJson<String>(json['englishName']),
      nativeName: serializer.fromJson<String>(json['nativeName']),
      flag: serializer.fromJson<String>(json['flag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'englishName': serializer.toJson<String>(englishName),
      'nativeName': serializer.toJson<String>(nativeName),
      'flag': serializer.toJson<String>(flag),
    };
  }

  Language copyWith({
    String? code,
    String? englishName,
    String? nativeName,
    String? flag,
  }) => Language(
    code: code ?? this.code,
    englishName: englishName ?? this.englishName,
    nativeName: nativeName ?? this.nativeName,
    flag: flag ?? this.flag,
  );
  Language copyWithCompanion(LanguagesCompanion data) {
    return Language(
      code: data.code.present ? data.code.value : this.code,
      englishName: data.englishName.present
          ? data.englishName.value
          : this.englishName,
      nativeName: data.nativeName.present
          ? data.nativeName.value
          : this.nativeName,
      flag: data.flag.present ? data.flag.value : this.flag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Language(')
          ..write('code: $code, ')
          ..write('englishName: $englishName, ')
          ..write('nativeName: $nativeName, ')
          ..write('flag: $flag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, englishName, nativeName, flag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Language &&
          other.code == this.code &&
          other.englishName == this.englishName &&
          other.nativeName == this.nativeName &&
          other.flag == this.flag);
}

class LanguagesCompanion extends UpdateCompanion<Language> {
  final Value<String> code;
  final Value<String> englishName;
  final Value<String> nativeName;
  final Value<String> flag;
  final Value<int> rowid;
  const LanguagesCompanion({
    this.code = const Value.absent(),
    this.englishName = const Value.absent(),
    this.nativeName = const Value.absent(),
    this.flag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LanguagesCompanion.insert({
    required String code,
    required String englishName,
    required String nativeName,
    required String flag,
    this.rowid = const Value.absent(),
  }) : code = Value(code),
       englishName = Value(englishName),
       nativeName = Value(nativeName),
       flag = Value(flag);
  static Insertable<Language> custom({
    Expression<String>? code,
    Expression<String>? englishName,
    Expression<String>? nativeName,
    Expression<String>? flag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (englishName != null) 'english_name': englishName,
      if (nativeName != null) 'native_name': nativeName,
      if (flag != null) 'flag': flag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LanguagesCompanion copyWith({
    Value<String>? code,
    Value<String>? englishName,
    Value<String>? nativeName,
    Value<String>? flag,
    Value<int>? rowid,
  }) {
    return LanguagesCompanion(
      code: code ?? this.code,
      englishName: englishName ?? this.englishName,
      nativeName: nativeName ?? this.nativeName,
      flag: flag ?? this.flag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (englishName.present) {
      map['english_name'] = Variable<String>(englishName.value);
    }
    if (nativeName.present) {
      map['native_name'] = Variable<String>(nativeName.value);
    }
    if (flag.present) {
      map['flag'] = Variable<String>(flag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LanguagesCompanion(')
          ..write('code: $code, ')
          ..write('englishName: $englishName, ')
          ..write('nativeName: $nativeName, ')
          ..write('flag: $flag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TopicPacksTable extends TopicPacks
    with TableInfo<$TopicPacksTable, TopicPack> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicPacksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayOrderMeta = const VerificationMeta(
    'displayOrder',
  );
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
    'display_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    languageCode,
    slug,
    name,
    emoji,
    displayOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topic_packs';
  @override
  VerificationContext validateIntegrity(
    Insertable<TopicPack> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_languageCodeMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    } else if (isInserting) {
      context.missing(_emojiMeta);
    }
    if (data.containsKey('display_order')) {
      context.handle(
        _displayOrderMeta,
        displayOrder.isAcceptableOrUnknown(
          data['display_order']!,
          _displayOrderMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TopicPack map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopicPack(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      )!,
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      )!,
      displayOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}display_order'],
      )!,
    );
  }

  @override
  $TopicPacksTable createAlias(String alias) {
    return $TopicPacksTable(attachedDatabase, alias);
  }
}

class TopicPack extends DataClass implements Insertable<TopicPack> {
  final String id;
  final String languageCode;
  final String slug;
  final String name;
  final String emoji;
  final int displayOrder;
  const TopicPack({
    required this.id,
    required this.languageCode,
    required this.slug,
    required this.name,
    required this.emoji,
    required this.displayOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['language_code'] = Variable<String>(languageCode);
    map['slug'] = Variable<String>(slug);
    map['name'] = Variable<String>(name);
    map['emoji'] = Variable<String>(emoji);
    map['display_order'] = Variable<int>(displayOrder);
    return map;
  }

  TopicPacksCompanion toCompanion(bool nullToAbsent) {
    return TopicPacksCompanion(
      id: Value(id),
      languageCode: Value(languageCode),
      slug: Value(slug),
      name: Value(name),
      emoji: Value(emoji),
      displayOrder: Value(displayOrder),
    );
  }

  factory TopicPack.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopicPack(
      id: serializer.fromJson<String>(json['id']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
      slug: serializer.fromJson<String>(json['slug']),
      name: serializer.fromJson<String>(json['name']),
      emoji: serializer.fromJson<String>(json['emoji']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'languageCode': serializer.toJson<String>(languageCode),
      'slug': serializer.toJson<String>(slug),
      'name': serializer.toJson<String>(name),
      'emoji': serializer.toJson<String>(emoji),
      'displayOrder': serializer.toJson<int>(displayOrder),
    };
  }

  TopicPack copyWith({
    String? id,
    String? languageCode,
    String? slug,
    String? name,
    String? emoji,
    int? displayOrder,
  }) => TopicPack(
    id: id ?? this.id,
    languageCode: languageCode ?? this.languageCode,
    slug: slug ?? this.slug,
    name: name ?? this.name,
    emoji: emoji ?? this.emoji,
    displayOrder: displayOrder ?? this.displayOrder,
  );
  TopicPack copyWithCompanion(TopicPacksCompanion data) {
    return TopicPack(
      id: data.id.present ? data.id.value : this.id,
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      slug: data.slug.present ? data.slug.value : this.slug,
      name: data.name.present ? data.name.value : this.name,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TopicPack(')
          ..write('id: $id, ')
          ..write('languageCode: $languageCode, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('emoji: $emoji, ')
          ..write('displayOrder: $displayOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, languageCode, slug, name, emoji, displayOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopicPack &&
          other.id == this.id &&
          other.languageCode == this.languageCode &&
          other.slug == this.slug &&
          other.name == this.name &&
          other.emoji == this.emoji &&
          other.displayOrder == this.displayOrder);
}

class TopicPacksCompanion extends UpdateCompanion<TopicPack> {
  final Value<String> id;
  final Value<String> languageCode;
  final Value<String> slug;
  final Value<String> name;
  final Value<String> emoji;
  final Value<int> displayOrder;
  final Value<int> rowid;
  const TopicPacksCompanion({
    this.id = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.slug = const Value.absent(),
    this.name = const Value.absent(),
    this.emoji = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicPacksCompanion.insert({
    required String id,
    required String languageCode,
    required String slug,
    required String name,
    required String emoji,
    this.displayOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       languageCode = Value(languageCode),
       slug = Value(slug),
       name = Value(name),
       emoji = Value(emoji);
  static Insertable<TopicPack> custom({
    Expression<String>? id,
    Expression<String>? languageCode,
    Expression<String>? slug,
    Expression<String>? name,
    Expression<String>? emoji,
    Expression<int>? displayOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageCode != null) 'language_code': languageCode,
      if (slug != null) 'slug': slug,
      if (name != null) 'name': name,
      if (emoji != null) 'emoji': emoji,
      if (displayOrder != null) 'display_order': displayOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicPacksCompanion copyWith({
    Value<String>? id,
    Value<String>? languageCode,
    Value<String>? slug,
    Value<String>? name,
    Value<String>? emoji,
    Value<int>? displayOrder,
    Value<int>? rowid,
  }) {
    return TopicPacksCompanion(
      id: id ?? this.id,
      languageCode: languageCode ?? this.languageCode,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      displayOrder: displayOrder ?? this.displayOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicPacksCompanion(')
          ..write('id: $id, ')
          ..write('languageCode: $languageCode, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('emoji: $emoji, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhrasesTable extends Phrases with TableInfo<$PhrasesTable, Phrase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhrasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packIdMeta = const VerificationMeta('packId');
  @override
  late final GeneratedColumn<String> packId = GeneratedColumn<String>(
    'pack_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nativePromptMeta = const VerificationMeta(
    'nativePrompt',
  );
  @override
  late final GeneratedColumn<String> nativePrompt = GeneratedColumn<String>(
    'native_prompt',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetTextMeta = const VerificationMeta(
    'targetText',
  );
  @override
  late final GeneratedColumn<String> targetText = GeneratedColumn<String>(
    'target_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pronunciationMeta = const VerificationMeta(
    'pronunciation',
  );
  @override
  late final GeneratedColumn<String> pronunciation = GeneratedColumn<String>(
    'pronunciation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _audioPathMeta = const VerificationMeta(
    'audioPath',
  );
  @override
  late final GeneratedColumn<String> audioPath = GeneratedColumn<String>(
    'audio_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _displayOrderMeta = const VerificationMeta(
    'displayOrder',
  );
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
    'display_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    packId,
    languageCode,
    nativePrompt,
    targetText,
    pronunciation,
    audioPath,
    displayOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'phrases';
  @override
  VerificationContext validateIntegrity(
    Insertable<Phrase> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pack_id')) {
      context.handle(
        _packIdMeta,
        packId.isAcceptableOrUnknown(data['pack_id']!, _packIdMeta),
      );
    } else if (isInserting) {
      context.missing(_packIdMeta);
    }
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_languageCodeMeta);
    }
    if (data.containsKey('native_prompt')) {
      context.handle(
        _nativePromptMeta,
        nativePrompt.isAcceptableOrUnknown(
          data['native_prompt']!,
          _nativePromptMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nativePromptMeta);
    }
    if (data.containsKey('target_text')) {
      context.handle(
        _targetTextMeta,
        targetText.isAcceptableOrUnknown(data['target_text']!, _targetTextMeta),
      );
    } else if (isInserting) {
      context.missing(_targetTextMeta);
    }
    if (data.containsKey('pronunciation')) {
      context.handle(
        _pronunciationMeta,
        pronunciation.isAcceptableOrUnknown(
          data['pronunciation']!,
          _pronunciationMeta,
        ),
      );
    }
    if (data.containsKey('audio_path')) {
      context.handle(
        _audioPathMeta,
        audioPath.isAcceptableOrUnknown(data['audio_path']!, _audioPathMeta),
      );
    }
    if (data.containsKey('display_order')) {
      context.handle(
        _displayOrderMeta,
        displayOrder.isAcceptableOrUnknown(
          data['display_order']!,
          _displayOrderMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Phrase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Phrase(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      packId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pack_id'],
      )!,
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      )!,
      nativePrompt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}native_prompt'],
      )!,
      targetText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_text'],
      )!,
      pronunciation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pronunciation'],
      ),
      audioPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_path'],
      ),
      displayOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}display_order'],
      )!,
    );
  }

  @override
  $PhrasesTable createAlias(String alias) {
    return $PhrasesTable(attachedDatabase, alias);
  }
}

class Phrase extends DataClass implements Insertable<Phrase> {
  final String id;
  final String packId;
  final String languageCode;
  final String nativePrompt;
  final String targetText;
  final String? pronunciation;
  final String? audioPath;
  final int displayOrder;
  const Phrase({
    required this.id,
    required this.packId,
    required this.languageCode,
    required this.nativePrompt,
    required this.targetText,
    this.pronunciation,
    this.audioPath,
    required this.displayOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pack_id'] = Variable<String>(packId);
    map['language_code'] = Variable<String>(languageCode);
    map['native_prompt'] = Variable<String>(nativePrompt);
    map['target_text'] = Variable<String>(targetText);
    if (!nullToAbsent || pronunciation != null) {
      map['pronunciation'] = Variable<String>(pronunciation);
    }
    if (!nullToAbsent || audioPath != null) {
      map['audio_path'] = Variable<String>(audioPath);
    }
    map['display_order'] = Variable<int>(displayOrder);
    return map;
  }

  PhrasesCompanion toCompanion(bool nullToAbsent) {
    return PhrasesCompanion(
      id: Value(id),
      packId: Value(packId),
      languageCode: Value(languageCode),
      nativePrompt: Value(nativePrompt),
      targetText: Value(targetText),
      pronunciation: pronunciation == null && nullToAbsent
          ? const Value.absent()
          : Value(pronunciation),
      audioPath: audioPath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioPath),
      displayOrder: Value(displayOrder),
    );
  }

  factory Phrase.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Phrase(
      id: serializer.fromJson<String>(json['id']),
      packId: serializer.fromJson<String>(json['packId']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
      nativePrompt: serializer.fromJson<String>(json['nativePrompt']),
      targetText: serializer.fromJson<String>(json['targetText']),
      pronunciation: serializer.fromJson<String?>(json['pronunciation']),
      audioPath: serializer.fromJson<String?>(json['audioPath']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'packId': serializer.toJson<String>(packId),
      'languageCode': serializer.toJson<String>(languageCode),
      'nativePrompt': serializer.toJson<String>(nativePrompt),
      'targetText': serializer.toJson<String>(targetText),
      'pronunciation': serializer.toJson<String?>(pronunciation),
      'audioPath': serializer.toJson<String?>(audioPath),
      'displayOrder': serializer.toJson<int>(displayOrder),
    };
  }

  Phrase copyWith({
    String? id,
    String? packId,
    String? languageCode,
    String? nativePrompt,
    String? targetText,
    Value<String?> pronunciation = const Value.absent(),
    Value<String?> audioPath = const Value.absent(),
    int? displayOrder,
  }) => Phrase(
    id: id ?? this.id,
    packId: packId ?? this.packId,
    languageCode: languageCode ?? this.languageCode,
    nativePrompt: nativePrompt ?? this.nativePrompt,
    targetText: targetText ?? this.targetText,
    pronunciation: pronunciation.present
        ? pronunciation.value
        : this.pronunciation,
    audioPath: audioPath.present ? audioPath.value : this.audioPath,
    displayOrder: displayOrder ?? this.displayOrder,
  );
  Phrase copyWithCompanion(PhrasesCompanion data) {
    return Phrase(
      id: data.id.present ? data.id.value : this.id,
      packId: data.packId.present ? data.packId.value : this.packId,
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      nativePrompt: data.nativePrompt.present
          ? data.nativePrompt.value
          : this.nativePrompt,
      targetText: data.targetText.present
          ? data.targetText.value
          : this.targetText,
      pronunciation: data.pronunciation.present
          ? data.pronunciation.value
          : this.pronunciation,
      audioPath: data.audioPath.present ? data.audioPath.value : this.audioPath,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Phrase(')
          ..write('id: $id, ')
          ..write('packId: $packId, ')
          ..write('languageCode: $languageCode, ')
          ..write('nativePrompt: $nativePrompt, ')
          ..write('targetText: $targetText, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('audioPath: $audioPath, ')
          ..write('displayOrder: $displayOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    packId,
    languageCode,
    nativePrompt,
    targetText,
    pronunciation,
    audioPath,
    displayOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Phrase &&
          other.id == this.id &&
          other.packId == this.packId &&
          other.languageCode == this.languageCode &&
          other.nativePrompt == this.nativePrompt &&
          other.targetText == this.targetText &&
          other.pronunciation == this.pronunciation &&
          other.audioPath == this.audioPath &&
          other.displayOrder == this.displayOrder);
}

class PhrasesCompanion extends UpdateCompanion<Phrase> {
  final Value<String> id;
  final Value<String> packId;
  final Value<String> languageCode;
  final Value<String> nativePrompt;
  final Value<String> targetText;
  final Value<String?> pronunciation;
  final Value<String?> audioPath;
  final Value<int> displayOrder;
  final Value<int> rowid;
  const PhrasesCompanion({
    this.id = const Value.absent(),
    this.packId = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.nativePrompt = const Value.absent(),
    this.targetText = const Value.absent(),
    this.pronunciation = const Value.absent(),
    this.audioPath = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhrasesCompanion.insert({
    required String id,
    required String packId,
    required String languageCode,
    required String nativePrompt,
    required String targetText,
    this.pronunciation = const Value.absent(),
    this.audioPath = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       packId = Value(packId),
       languageCode = Value(languageCode),
       nativePrompt = Value(nativePrompt),
       targetText = Value(targetText);
  static Insertable<Phrase> custom({
    Expression<String>? id,
    Expression<String>? packId,
    Expression<String>? languageCode,
    Expression<String>? nativePrompt,
    Expression<String>? targetText,
    Expression<String>? pronunciation,
    Expression<String>? audioPath,
    Expression<int>? displayOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packId != null) 'pack_id': packId,
      if (languageCode != null) 'language_code': languageCode,
      if (nativePrompt != null) 'native_prompt': nativePrompt,
      if (targetText != null) 'target_text': targetText,
      if (pronunciation != null) 'pronunciation': pronunciation,
      if (audioPath != null) 'audio_path': audioPath,
      if (displayOrder != null) 'display_order': displayOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhrasesCompanion copyWith({
    Value<String>? id,
    Value<String>? packId,
    Value<String>? languageCode,
    Value<String>? nativePrompt,
    Value<String>? targetText,
    Value<String?>? pronunciation,
    Value<String?>? audioPath,
    Value<int>? displayOrder,
    Value<int>? rowid,
  }) {
    return PhrasesCompanion(
      id: id ?? this.id,
      packId: packId ?? this.packId,
      languageCode: languageCode ?? this.languageCode,
      nativePrompt: nativePrompt ?? this.nativePrompt,
      targetText: targetText ?? this.targetText,
      pronunciation: pronunciation ?? this.pronunciation,
      audioPath: audioPath ?? this.audioPath,
      displayOrder: displayOrder ?? this.displayOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (packId.present) {
      map['pack_id'] = Variable<String>(packId.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (nativePrompt.present) {
      map['native_prompt'] = Variable<String>(nativePrompt.value);
    }
    if (targetText.present) {
      map['target_text'] = Variable<String>(targetText.value);
    }
    if (pronunciation.present) {
      map['pronunciation'] = Variable<String>(pronunciation.value);
    }
    if (audioPath.present) {
      map['audio_path'] = Variable<String>(audioPath.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhrasesCompanion(')
          ..write('id: $id, ')
          ..write('packId: $packId, ')
          ..write('languageCode: $languageCode, ')
          ..write('nativePrompt: $nativePrompt, ')
          ..write('targetText: $targetText, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('audioPath: $audioPath, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserPreferencesTable extends UserPreferences
    with TableInfo<$UserPreferencesTable, UserPreference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserPreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _activeLanguageCodeMeta =
      const VerificationMeta('activeLanguageCode');
  @override
  late final GeneratedColumn<String> activeLanguageCode =
      GeneratedColumn<String>(
        'active_language_code',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _dailyGoalMinutesMeta = const VerificationMeta(
    'dailyGoalMinutes',
  );
  @override
  late final GeneratedColumn<int> dailyGoalMinutes = GeneratedColumn<int>(
    'daily_goal_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('system'),
  );
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
    'notifications_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notifications_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _onboardedAtMeta = const VerificationMeta(
    'onboardedAt',
  );
  @override
  late final GeneratedColumn<DateTime> onboardedAt = GeneratedColumn<DateTime>(
    'onboarded_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastQuizAtMeta = const VerificationMeta(
    'lastQuizAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastQuizAt = GeneratedColumn<DateTime>(
    'last_quiz_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    activeLanguageCode,
    dailyGoalMinutes,
    themeMode,
    notificationsEnabled,
    onboardedAt,
    lastQuizAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserPreference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('active_language_code')) {
      context.handle(
        _activeLanguageCodeMeta,
        activeLanguageCode.isAcceptableOrUnknown(
          data['active_language_code']!,
          _activeLanguageCodeMeta,
        ),
      );
    }
    if (data.containsKey('daily_goal_minutes')) {
      context.handle(
        _dailyGoalMinutesMeta,
        dailyGoalMinutes.isAcceptableOrUnknown(
          data['daily_goal_minutes']!,
          _dailyGoalMinutesMeta,
        ),
      );
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
        _notificationsEnabledMeta,
        notificationsEnabled.isAcceptableOrUnknown(
          data['notifications_enabled']!,
          _notificationsEnabledMeta,
        ),
      );
    }
    if (data.containsKey('onboarded_at')) {
      context.handle(
        _onboardedAtMeta,
        onboardedAt.isAcceptableOrUnknown(
          data['onboarded_at']!,
          _onboardedAtMeta,
        ),
      );
    }
    if (data.containsKey('last_quiz_at')) {
      context.handle(
        _lastQuizAtMeta,
        lastQuizAt.isAcceptableOrUnknown(
          data['last_quiz_at']!,
          _lastQuizAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserPreference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPreference(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      activeLanguageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}active_language_code'],
      ),
      dailyGoalMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_goal_minutes'],
      )!,
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notifications_enabled'],
      )!,
      onboardedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}onboarded_at'],
      ),
      lastQuizAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_quiz_at'],
      ),
    );
  }

  @override
  $UserPreferencesTable createAlias(String alias) {
    return $UserPreferencesTable(attachedDatabase, alias);
  }
}

class UserPreference extends DataClass implements Insertable<UserPreference> {
  final int id;
  final String? activeLanguageCode;
  final int dailyGoalMinutes;
  final String themeMode;
  final bool notificationsEnabled;
  final DateTime? onboardedAt;
  final DateTime? lastQuizAt;
  const UserPreference({
    required this.id,
    this.activeLanguageCode,
    required this.dailyGoalMinutes,
    required this.themeMode,
    required this.notificationsEnabled,
    this.onboardedAt,
    this.lastQuizAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || activeLanguageCode != null) {
      map['active_language_code'] = Variable<String>(activeLanguageCode);
    }
    map['daily_goal_minutes'] = Variable<int>(dailyGoalMinutes);
    map['theme_mode'] = Variable<String>(themeMode);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    if (!nullToAbsent || onboardedAt != null) {
      map['onboarded_at'] = Variable<DateTime>(onboardedAt);
    }
    if (!nullToAbsent || lastQuizAt != null) {
      map['last_quiz_at'] = Variable<DateTime>(lastQuizAt);
    }
    return map;
  }

  UserPreferencesCompanion toCompanion(bool nullToAbsent) {
    return UserPreferencesCompanion(
      id: Value(id),
      activeLanguageCode: activeLanguageCode == null && nullToAbsent
          ? const Value.absent()
          : Value(activeLanguageCode),
      dailyGoalMinutes: Value(dailyGoalMinutes),
      themeMode: Value(themeMode),
      notificationsEnabled: Value(notificationsEnabled),
      onboardedAt: onboardedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(onboardedAt),
      lastQuizAt: lastQuizAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastQuizAt),
    );
  }

  factory UserPreference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPreference(
      id: serializer.fromJson<int>(json['id']),
      activeLanguageCode: serializer.fromJson<String?>(
        json['activeLanguageCode'],
      ),
      dailyGoalMinutes: serializer.fromJson<int>(json['dailyGoalMinutes']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      notificationsEnabled: serializer.fromJson<bool>(
        json['notificationsEnabled'],
      ),
      onboardedAt: serializer.fromJson<DateTime?>(json['onboardedAt']),
      lastQuizAt: serializer.fromJson<DateTime?>(json['lastQuizAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activeLanguageCode': serializer.toJson<String?>(activeLanguageCode),
      'dailyGoalMinutes': serializer.toJson<int>(dailyGoalMinutes),
      'themeMode': serializer.toJson<String>(themeMode),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'onboardedAt': serializer.toJson<DateTime?>(onboardedAt),
      'lastQuizAt': serializer.toJson<DateTime?>(lastQuizAt),
    };
  }

  UserPreference copyWith({
    int? id,
    Value<String?> activeLanguageCode = const Value.absent(),
    int? dailyGoalMinutes,
    String? themeMode,
    bool? notificationsEnabled,
    Value<DateTime?> onboardedAt = const Value.absent(),
    Value<DateTime?> lastQuizAt = const Value.absent(),
  }) => UserPreference(
    id: id ?? this.id,
    activeLanguageCode: activeLanguageCode.present
        ? activeLanguageCode.value
        : this.activeLanguageCode,
    dailyGoalMinutes: dailyGoalMinutes ?? this.dailyGoalMinutes,
    themeMode: themeMode ?? this.themeMode,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    onboardedAt: onboardedAt.present ? onboardedAt.value : this.onboardedAt,
    lastQuizAt: lastQuizAt.present ? lastQuizAt.value : this.lastQuizAt,
  );
  UserPreference copyWithCompanion(UserPreferencesCompanion data) {
    return UserPreference(
      id: data.id.present ? data.id.value : this.id,
      activeLanguageCode: data.activeLanguageCode.present
          ? data.activeLanguageCode.value
          : this.activeLanguageCode,
      dailyGoalMinutes: data.dailyGoalMinutes.present
          ? data.dailyGoalMinutes.value
          : this.dailyGoalMinutes,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      onboardedAt: data.onboardedAt.present
          ? data.onboardedAt.value
          : this.onboardedAt,
      lastQuizAt: data.lastQuizAt.present
          ? data.lastQuizAt.value
          : this.lastQuizAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserPreference(')
          ..write('id: $id, ')
          ..write('activeLanguageCode: $activeLanguageCode, ')
          ..write('dailyGoalMinutes: $dailyGoalMinutes, ')
          ..write('themeMode: $themeMode, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('onboardedAt: $onboardedAt, ')
          ..write('lastQuizAt: $lastQuizAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    activeLanguageCode,
    dailyGoalMinutes,
    themeMode,
    notificationsEnabled,
    onboardedAt,
    lastQuizAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPreference &&
          other.id == this.id &&
          other.activeLanguageCode == this.activeLanguageCode &&
          other.dailyGoalMinutes == this.dailyGoalMinutes &&
          other.themeMode == this.themeMode &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.onboardedAt == this.onboardedAt &&
          other.lastQuizAt == this.lastQuizAt);
}

class UserPreferencesCompanion extends UpdateCompanion<UserPreference> {
  final Value<int> id;
  final Value<String?> activeLanguageCode;
  final Value<int> dailyGoalMinutes;
  final Value<String> themeMode;
  final Value<bool> notificationsEnabled;
  final Value<DateTime?> onboardedAt;
  final Value<DateTime?> lastQuizAt;
  const UserPreferencesCompanion({
    this.id = const Value.absent(),
    this.activeLanguageCode = const Value.absent(),
    this.dailyGoalMinutes = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.onboardedAt = const Value.absent(),
    this.lastQuizAt = const Value.absent(),
  });
  UserPreferencesCompanion.insert({
    this.id = const Value.absent(),
    this.activeLanguageCode = const Value.absent(),
    this.dailyGoalMinutes = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.onboardedAt = const Value.absent(),
    this.lastQuizAt = const Value.absent(),
  });
  static Insertable<UserPreference> custom({
    Expression<int>? id,
    Expression<String>? activeLanguageCode,
    Expression<int>? dailyGoalMinutes,
    Expression<String>? themeMode,
    Expression<bool>? notificationsEnabled,
    Expression<DateTime>? onboardedAt,
    Expression<DateTime>? lastQuizAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activeLanguageCode != null)
        'active_language_code': activeLanguageCode,
      if (dailyGoalMinutes != null) 'daily_goal_minutes': dailyGoalMinutes,
      if (themeMode != null) 'theme_mode': themeMode,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (onboardedAt != null) 'onboarded_at': onboardedAt,
      if (lastQuizAt != null) 'last_quiz_at': lastQuizAt,
    });
  }

  UserPreferencesCompanion copyWith({
    Value<int>? id,
    Value<String?>? activeLanguageCode,
    Value<int>? dailyGoalMinutes,
    Value<String>? themeMode,
    Value<bool>? notificationsEnabled,
    Value<DateTime?>? onboardedAt,
    Value<DateTime?>? lastQuizAt,
  }) {
    return UserPreferencesCompanion(
      id: id ?? this.id,
      activeLanguageCode: activeLanguageCode ?? this.activeLanguageCode,
      dailyGoalMinutes: dailyGoalMinutes ?? this.dailyGoalMinutes,
      themeMode: themeMode ?? this.themeMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      onboardedAt: onboardedAt ?? this.onboardedAt,
      lastQuizAt: lastQuizAt ?? this.lastQuizAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activeLanguageCode.present) {
      map['active_language_code'] = Variable<String>(activeLanguageCode.value);
    }
    if (dailyGoalMinutes.present) {
      map['daily_goal_minutes'] = Variable<int>(dailyGoalMinutes.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (onboardedAt.present) {
      map['onboarded_at'] = Variable<DateTime>(onboardedAt.value);
    }
    if (lastQuizAt.present) {
      map['last_quiz_at'] = Variable<DateTime>(lastQuizAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPreferencesCompanion(')
          ..write('id: $id, ')
          ..write('activeLanguageCode: $activeLanguageCode, ')
          ..write('dailyGoalMinutes: $dailyGoalMinutes, ')
          ..write('themeMode: $themeMode, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('onboardedAt: $onboardedAt, ')
          ..write('lastQuizAt: $lastQuizAt')
          ..write(')'))
        .toString();
  }
}

class $CardProgressTable extends CardProgress
    with TableInfo<$CardProgressTable, CardProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _phraseIdMeta = const VerificationMeta(
    'phraseId',
  );
  @override
  late final GeneratedColumn<String> phraseId = GeneratedColumn<String>(
    'phrase_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _easeFactorMeta = const VerificationMeta(
    'easeFactor',
  );
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
    'ease_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _intervalDaysMeta = const VerificationMeta(
    'intervalDays',
  );
  @override
  late final GeneratedColumn<int> intervalDays = GeneratedColumn<int>(
    'interval_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _repetitionsMeta = const VerificationMeta(
    'repetitions',
  );
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
    'repetitions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextDueAtMeta = const VerificationMeta(
    'nextDueAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextDueAt = GeneratedColumn<DateTime>(
    'next_due_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastReviewedAtMeta = const VerificationMeta(
    'lastReviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>(
        'last_reviewed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _totalReviewsMeta = const VerificationMeta(
    'totalReviews',
  );
  @override
  late final GeneratedColumn<int> totalReviews = GeneratedColumn<int>(
    'total_reviews',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    phraseId,
    languageCode,
    easeFactor,
    intervalDays,
    repetitions,
    nextDueAt,
    lastReviewedAt,
    totalReviews,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<CardProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('phrase_id')) {
      context.handle(
        _phraseIdMeta,
        phraseId.isAcceptableOrUnknown(data['phrase_id']!, _phraseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_phraseIdMeta);
    }
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_languageCodeMeta);
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
        _easeFactorMeta,
        easeFactor.isAcceptableOrUnknown(data['ease_factor']!, _easeFactorMeta),
      );
    }
    if (data.containsKey('interval_days')) {
      context.handle(
        _intervalDaysMeta,
        intervalDays.isAcceptableOrUnknown(
          data['interval_days']!,
          _intervalDaysMeta,
        ),
      );
    }
    if (data.containsKey('repetitions')) {
      context.handle(
        _repetitionsMeta,
        repetitions.isAcceptableOrUnknown(
          data['repetitions']!,
          _repetitionsMeta,
        ),
      );
    }
    if (data.containsKey('next_due_at')) {
      context.handle(
        _nextDueAtMeta,
        nextDueAt.isAcceptableOrUnknown(data['next_due_at']!, _nextDueAtMeta),
      );
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
        _lastReviewedAtMeta,
        lastReviewedAt.isAcceptableOrUnknown(
          data['last_reviewed_at']!,
          _lastReviewedAtMeta,
        ),
      );
    }
    if (data.containsKey('total_reviews')) {
      context.handle(
        _totalReviewsMeta,
        totalReviews.isAcceptableOrUnknown(
          data['total_reviews']!,
          _totalReviewsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {phraseId};
  @override
  CardProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardProgressData(
      phraseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phrase_id'],
      )!,
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      )!,
      easeFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ease_factor'],
      )!,
      intervalDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval_days'],
      )!,
      repetitions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetitions'],
      )!,
      nextDueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_due_at'],
      ),
      lastReviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reviewed_at'],
      ),
      totalReviews: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_reviews'],
      )!,
    );
  }

  @override
  $CardProgressTable createAlias(String alias) {
    return $CardProgressTable(attachedDatabase, alias);
  }
}

class CardProgressData extends DataClass
    implements Insertable<CardProgressData> {
  final String phraseId;
  final String languageCode;
  final double easeFactor;
  final int intervalDays;
  final int repetitions;
  final DateTime? nextDueAt;
  final DateTime? lastReviewedAt;
  final int totalReviews;
  const CardProgressData({
    required this.phraseId,
    required this.languageCode,
    required this.easeFactor,
    required this.intervalDays,
    required this.repetitions,
    this.nextDueAt,
    this.lastReviewedAt,
    required this.totalReviews,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['phrase_id'] = Variable<String>(phraseId);
    map['language_code'] = Variable<String>(languageCode);
    map['ease_factor'] = Variable<double>(easeFactor);
    map['interval_days'] = Variable<int>(intervalDays);
    map['repetitions'] = Variable<int>(repetitions);
    if (!nullToAbsent || nextDueAt != null) {
      map['next_due_at'] = Variable<DateTime>(nextDueAt);
    }
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    map['total_reviews'] = Variable<int>(totalReviews);
    return map;
  }

  CardProgressCompanion toCompanion(bool nullToAbsent) {
    return CardProgressCompanion(
      phraseId: Value(phraseId),
      languageCode: Value(languageCode),
      easeFactor: Value(easeFactor),
      intervalDays: Value(intervalDays),
      repetitions: Value(repetitions),
      nextDueAt: nextDueAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextDueAt),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
      totalReviews: Value(totalReviews),
    );
  }

  factory CardProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardProgressData(
      phraseId: serializer.fromJson<String>(json['phraseId']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
      intervalDays: serializer.fromJson<int>(json['intervalDays']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
      nextDueAt: serializer.fromJson<DateTime?>(json['nextDueAt']),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
      totalReviews: serializer.fromJson<int>(json['totalReviews']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'phraseId': serializer.toJson<String>(phraseId),
      'languageCode': serializer.toJson<String>(languageCode),
      'easeFactor': serializer.toJson<double>(easeFactor),
      'intervalDays': serializer.toJson<int>(intervalDays),
      'repetitions': serializer.toJson<int>(repetitions),
      'nextDueAt': serializer.toJson<DateTime?>(nextDueAt),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
      'totalReviews': serializer.toJson<int>(totalReviews),
    };
  }

  CardProgressData copyWith({
    String? phraseId,
    String? languageCode,
    double? easeFactor,
    int? intervalDays,
    int? repetitions,
    Value<DateTime?> nextDueAt = const Value.absent(),
    Value<DateTime?> lastReviewedAt = const Value.absent(),
    int? totalReviews,
  }) => CardProgressData(
    phraseId: phraseId ?? this.phraseId,
    languageCode: languageCode ?? this.languageCode,
    easeFactor: easeFactor ?? this.easeFactor,
    intervalDays: intervalDays ?? this.intervalDays,
    repetitions: repetitions ?? this.repetitions,
    nextDueAt: nextDueAt.present ? nextDueAt.value : this.nextDueAt,
    lastReviewedAt: lastReviewedAt.present
        ? lastReviewedAt.value
        : this.lastReviewedAt,
    totalReviews: totalReviews ?? this.totalReviews,
  );
  CardProgressData copyWithCompanion(CardProgressCompanion data) {
    return CardProgressData(
      phraseId: data.phraseId.present ? data.phraseId.value : this.phraseId,
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      easeFactor: data.easeFactor.present
          ? data.easeFactor.value
          : this.easeFactor,
      intervalDays: data.intervalDays.present
          ? data.intervalDays.value
          : this.intervalDays,
      repetitions: data.repetitions.present
          ? data.repetitions.value
          : this.repetitions,
      nextDueAt: data.nextDueAt.present ? data.nextDueAt.value : this.nextDueAt,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
      totalReviews: data.totalReviews.present
          ? data.totalReviews.value
          : this.totalReviews,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardProgressData(')
          ..write('phraseId: $phraseId, ')
          ..write('languageCode: $languageCode, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('repetitions: $repetitions, ')
          ..write('nextDueAt: $nextDueAt, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('totalReviews: $totalReviews')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    phraseId,
    languageCode,
    easeFactor,
    intervalDays,
    repetitions,
    nextDueAt,
    lastReviewedAt,
    totalReviews,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardProgressData &&
          other.phraseId == this.phraseId &&
          other.languageCode == this.languageCode &&
          other.easeFactor == this.easeFactor &&
          other.intervalDays == this.intervalDays &&
          other.repetitions == this.repetitions &&
          other.nextDueAt == this.nextDueAt &&
          other.lastReviewedAt == this.lastReviewedAt &&
          other.totalReviews == this.totalReviews);
}

class CardProgressCompanion extends UpdateCompanion<CardProgressData> {
  final Value<String> phraseId;
  final Value<String> languageCode;
  final Value<double> easeFactor;
  final Value<int> intervalDays;
  final Value<int> repetitions;
  final Value<DateTime?> nextDueAt;
  final Value<DateTime?> lastReviewedAt;
  final Value<int> totalReviews;
  final Value<int> rowid;
  const CardProgressCompanion({
    this.phraseId = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.nextDueAt = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.totalReviews = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardProgressCompanion.insert({
    required String phraseId,
    required String languageCode,
    this.easeFactor = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.nextDueAt = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.totalReviews = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : phraseId = Value(phraseId),
       languageCode = Value(languageCode);
  static Insertable<CardProgressData> custom({
    Expression<String>? phraseId,
    Expression<String>? languageCode,
    Expression<double>? easeFactor,
    Expression<int>? intervalDays,
    Expression<int>? repetitions,
    Expression<DateTime>? nextDueAt,
    Expression<DateTime>? lastReviewedAt,
    Expression<int>? totalReviews,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (phraseId != null) 'phrase_id': phraseId,
      if (languageCode != null) 'language_code': languageCode,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (intervalDays != null) 'interval_days': intervalDays,
      if (repetitions != null) 'repetitions': repetitions,
      if (nextDueAt != null) 'next_due_at': nextDueAt,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
      if (totalReviews != null) 'total_reviews': totalReviews,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardProgressCompanion copyWith({
    Value<String>? phraseId,
    Value<String>? languageCode,
    Value<double>? easeFactor,
    Value<int>? intervalDays,
    Value<int>? repetitions,
    Value<DateTime?>? nextDueAt,
    Value<DateTime?>? lastReviewedAt,
    Value<int>? totalReviews,
    Value<int>? rowid,
  }) {
    return CardProgressCompanion(
      phraseId: phraseId ?? this.phraseId,
      languageCode: languageCode ?? this.languageCode,
      easeFactor: easeFactor ?? this.easeFactor,
      intervalDays: intervalDays ?? this.intervalDays,
      repetitions: repetitions ?? this.repetitions,
      nextDueAt: nextDueAt ?? this.nextDueAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      totalReviews: totalReviews ?? this.totalReviews,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (phraseId.present) {
      map['phrase_id'] = Variable<String>(phraseId.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (intervalDays.present) {
      map['interval_days'] = Variable<int>(intervalDays.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (nextDueAt.present) {
      map['next_due_at'] = Variable<DateTime>(nextDueAt.value);
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    if (totalReviews.present) {
      map['total_reviews'] = Variable<int>(totalReviews.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardProgressCompanion(')
          ..write('phraseId: $phraseId, ')
          ..write('languageCode: $languageCode, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('repetitions: $repetitions, ')
          ..write('nextDueAt: $nextDueAt, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('totalReviews: $totalReviews, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LessonSessionsTable extends LessonSessions
    with TableInfo<$LessonSessionsTable, LessonSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packIdMeta = const VerificationMeta('packId');
  @override
  late final GeneratedColumn<String> packId = GeneratedColumn<String>(
    'pack_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cardsReviewedMeta = const VerificationMeta(
    'cardsReviewed',
  );
  @override
  late final GeneratedColumn<int> cardsReviewed = GeneratedColumn<int>(
    'cards_reviewed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    languageCode,
    packId,
    startedAt,
    endedAt,
    cardsReviewed,
    durationSeconds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lesson_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<LessonSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_languageCodeMeta);
    }
    if (data.containsKey('pack_id')) {
      context.handle(
        _packIdMeta,
        packId.isAcceptableOrUnknown(data['pack_id']!, _packIdMeta),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('cards_reviewed')) {
      context.handle(
        _cardsReviewedMeta,
        cardsReviewed.isAcceptableOrUnknown(
          data['cards_reviewed']!,
          _cardsReviewedMeta,
        ),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LessonSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LessonSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      )!,
      packId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pack_id'],
      ),
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
      cardsReviewed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cards_reviewed'],
      )!,
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
    );
  }

  @override
  $LessonSessionsTable createAlias(String alias) {
    return $LessonSessionsTable(attachedDatabase, alias);
  }
}

class LessonSession extends DataClass implements Insertable<LessonSession> {
  final String id;
  final String languageCode;
  final String? packId;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int cardsReviewed;
  final int durationSeconds;
  const LessonSession({
    required this.id,
    required this.languageCode,
    this.packId,
    required this.startedAt,
    this.endedAt,
    required this.cardsReviewed,
    required this.durationSeconds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['language_code'] = Variable<String>(languageCode);
    if (!nullToAbsent || packId != null) {
      map['pack_id'] = Variable<String>(packId);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    map['cards_reviewed'] = Variable<int>(cardsReviewed);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    return map;
  }

  LessonSessionsCompanion toCompanion(bool nullToAbsent) {
    return LessonSessionsCompanion(
      id: Value(id),
      languageCode: Value(languageCode),
      packId: packId == null && nullToAbsent
          ? const Value.absent()
          : Value(packId),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      cardsReviewed: Value(cardsReviewed),
      durationSeconds: Value(durationSeconds),
    );
  }

  factory LessonSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LessonSession(
      id: serializer.fromJson<String>(json['id']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
      packId: serializer.fromJson<String?>(json['packId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      cardsReviewed: serializer.fromJson<int>(json['cardsReviewed']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'languageCode': serializer.toJson<String>(languageCode),
      'packId': serializer.toJson<String?>(packId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'cardsReviewed': serializer.toJson<int>(cardsReviewed),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
    };
  }

  LessonSession copyWith({
    String? id,
    String? languageCode,
    Value<String?> packId = const Value.absent(),
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
    int? cardsReviewed,
    int? durationSeconds,
  }) => LessonSession(
    id: id ?? this.id,
    languageCode: languageCode ?? this.languageCode,
    packId: packId.present ? packId.value : this.packId,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    cardsReviewed: cardsReviewed ?? this.cardsReviewed,
    durationSeconds: durationSeconds ?? this.durationSeconds,
  );
  LessonSession copyWithCompanion(LessonSessionsCompanion data) {
    return LessonSession(
      id: data.id.present ? data.id.value : this.id,
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      packId: data.packId.present ? data.packId.value : this.packId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      cardsReviewed: data.cardsReviewed.present
          ? data.cardsReviewed.value
          : this.cardsReviewed,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LessonSession(')
          ..write('id: $id, ')
          ..write('languageCode: $languageCode, ')
          ..write('packId: $packId, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('cardsReviewed: $cardsReviewed, ')
          ..write('durationSeconds: $durationSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    languageCode,
    packId,
    startedAt,
    endedAt,
    cardsReviewed,
    durationSeconds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LessonSession &&
          other.id == this.id &&
          other.languageCode == this.languageCode &&
          other.packId == this.packId &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.cardsReviewed == this.cardsReviewed &&
          other.durationSeconds == this.durationSeconds);
}

class LessonSessionsCompanion extends UpdateCompanion<LessonSession> {
  final Value<String> id;
  final Value<String> languageCode;
  final Value<String?> packId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<int> cardsReviewed;
  final Value<int> durationSeconds;
  final Value<int> rowid;
  const LessonSessionsCompanion({
    this.id = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.packId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.cardsReviewed = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LessonSessionsCompanion.insert({
    required String id,
    required String languageCode,
    this.packId = const Value.absent(),
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    this.cardsReviewed = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       languageCode = Value(languageCode),
       startedAt = Value(startedAt);
  static Insertable<LessonSession> custom({
    Expression<String>? id,
    Expression<String>? languageCode,
    Expression<String>? packId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<int>? cardsReviewed,
    Expression<int>? durationSeconds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageCode != null) 'language_code': languageCode,
      if (packId != null) 'pack_id': packId,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (cardsReviewed != null) 'cards_reviewed': cardsReviewed,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LessonSessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? languageCode,
    Value<String?>? packId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
    Value<int>? cardsReviewed,
    Value<int>? durationSeconds,
    Value<int>? rowid,
  }) {
    return LessonSessionsCompanion(
      id: id ?? this.id,
      languageCode: languageCode ?? this.languageCode,
      packId: packId ?? this.packId,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      cardsReviewed: cardsReviewed ?? this.cardsReviewed,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (packId.present) {
      map['pack_id'] = Variable<String>(packId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (cardsReviewed.present) {
      map['cards_reviewed'] = Variable<int>(cardsReviewed.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonSessionsCompanion(')
          ..write('id: $id, ')
          ..write('languageCode: $languageCode, ')
          ..write('packId: $packId, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('cardsReviewed: $cardsReviewed, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StreaksTable extends Streaks with TableInfo<$StreaksTable, Streak> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StreaksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentStreakMeta = const VerificationMeta(
    'currentStreak',
  );
  @override
  late final GeneratedColumn<int> currentStreak = GeneratedColumn<int>(
    'current_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _longestStreakMeta = const VerificationMeta(
    'longestStreak',
  );
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
    'longest_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastActivityDateMeta = const VerificationMeta(
    'lastActivityDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastActivityDate =
      GeneratedColumn<DateTime>(
        'last_activity_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _freezesAvailableMeta = const VerificationMeta(
    'freezesAvailable',
  );
  @override
  late final GeneratedColumn<int> freezesAvailable = GeneratedColumn<int>(
    'freezes_available',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    languageCode,
    currentStreak,
    longestStreak,
    lastActivityDate,
    freezesAvailable,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'streaks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Streak> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_languageCodeMeta);
    }
    if (data.containsKey('current_streak')) {
      context.handle(
        _currentStreakMeta,
        currentStreak.isAcceptableOrUnknown(
          data['current_streak']!,
          _currentStreakMeta,
        ),
      );
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
        _longestStreakMeta,
        longestStreak.isAcceptableOrUnknown(
          data['longest_streak']!,
          _longestStreakMeta,
        ),
      );
    }
    if (data.containsKey('last_activity_date')) {
      context.handle(
        _lastActivityDateMeta,
        lastActivityDate.isAcceptableOrUnknown(
          data['last_activity_date']!,
          _lastActivityDateMeta,
        ),
      );
    }
    if (data.containsKey('freezes_available')) {
      context.handle(
        _freezesAvailableMeta,
        freezesAvailable.isAcceptableOrUnknown(
          data['freezes_available']!,
          _freezesAvailableMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {languageCode};
  @override
  Streak map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Streak(
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      )!,
      currentStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_streak'],
      )!,
      longestStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}longest_streak'],
      )!,
      lastActivityDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_activity_date'],
      ),
      freezesAvailable: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}freezes_available'],
      )!,
    );
  }

  @override
  $StreaksTable createAlias(String alias) {
    return $StreaksTable(attachedDatabase, alias);
  }
}

class Streak extends DataClass implements Insertable<Streak> {
  final String languageCode;
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastActivityDate;
  final int freezesAvailable;
  const Streak({
    required this.languageCode,
    required this.currentStreak,
    required this.longestStreak,
    this.lastActivityDate,
    required this.freezesAvailable,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['language_code'] = Variable<String>(languageCode);
    map['current_streak'] = Variable<int>(currentStreak);
    map['longest_streak'] = Variable<int>(longestStreak);
    if (!nullToAbsent || lastActivityDate != null) {
      map['last_activity_date'] = Variable<DateTime>(lastActivityDate);
    }
    map['freezes_available'] = Variable<int>(freezesAvailable);
    return map;
  }

  StreaksCompanion toCompanion(bool nullToAbsent) {
    return StreaksCompanion(
      languageCode: Value(languageCode),
      currentStreak: Value(currentStreak),
      longestStreak: Value(longestStreak),
      lastActivityDate: lastActivityDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastActivityDate),
      freezesAvailable: Value(freezesAvailable),
    );
  }

  factory Streak.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Streak(
      languageCode: serializer.fromJson<String>(json['languageCode']),
      currentStreak: serializer.fromJson<int>(json['currentStreak']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
      lastActivityDate: serializer.fromJson<DateTime?>(
        json['lastActivityDate'],
      ),
      freezesAvailable: serializer.fromJson<int>(json['freezesAvailable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'languageCode': serializer.toJson<String>(languageCode),
      'currentStreak': serializer.toJson<int>(currentStreak),
      'longestStreak': serializer.toJson<int>(longestStreak),
      'lastActivityDate': serializer.toJson<DateTime?>(lastActivityDate),
      'freezesAvailable': serializer.toJson<int>(freezesAvailable),
    };
  }

  Streak copyWith({
    String? languageCode,
    int? currentStreak,
    int? longestStreak,
    Value<DateTime?> lastActivityDate = const Value.absent(),
    int? freezesAvailable,
  }) => Streak(
    languageCode: languageCode ?? this.languageCode,
    currentStreak: currentStreak ?? this.currentStreak,
    longestStreak: longestStreak ?? this.longestStreak,
    lastActivityDate: lastActivityDate.present
        ? lastActivityDate.value
        : this.lastActivityDate,
    freezesAvailable: freezesAvailable ?? this.freezesAvailable,
  );
  Streak copyWithCompanion(StreaksCompanion data) {
    return Streak(
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      currentStreak: data.currentStreak.present
          ? data.currentStreak.value
          : this.currentStreak,
      longestStreak: data.longestStreak.present
          ? data.longestStreak.value
          : this.longestStreak,
      lastActivityDate: data.lastActivityDate.present
          ? data.lastActivityDate.value
          : this.lastActivityDate,
      freezesAvailable: data.freezesAvailable.present
          ? data.freezesAvailable.value
          : this.freezesAvailable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Streak(')
          ..write('languageCode: $languageCode, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastActivityDate: $lastActivityDate, ')
          ..write('freezesAvailable: $freezesAvailable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    languageCode,
    currentStreak,
    longestStreak,
    lastActivityDate,
    freezesAvailable,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Streak &&
          other.languageCode == this.languageCode &&
          other.currentStreak == this.currentStreak &&
          other.longestStreak == this.longestStreak &&
          other.lastActivityDate == this.lastActivityDate &&
          other.freezesAvailable == this.freezesAvailable);
}

class StreaksCompanion extends UpdateCompanion<Streak> {
  final Value<String> languageCode;
  final Value<int> currentStreak;
  final Value<int> longestStreak;
  final Value<DateTime?> lastActivityDate;
  final Value<int> freezesAvailable;
  final Value<int> rowid;
  const StreaksCompanion({
    this.languageCode = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastActivityDate = const Value.absent(),
    this.freezesAvailable = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StreaksCompanion.insert({
    required String languageCode,
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastActivityDate = const Value.absent(),
    this.freezesAvailable = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : languageCode = Value(languageCode);
  static Insertable<Streak> custom({
    Expression<String>? languageCode,
    Expression<int>? currentStreak,
    Expression<int>? longestStreak,
    Expression<DateTime>? lastActivityDate,
    Expression<int>? freezesAvailable,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (languageCode != null) 'language_code': languageCode,
      if (currentStreak != null) 'current_streak': currentStreak,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (lastActivityDate != null) 'last_activity_date': lastActivityDate,
      if (freezesAvailable != null) 'freezes_available': freezesAvailable,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StreaksCompanion copyWith({
    Value<String>? languageCode,
    Value<int>? currentStreak,
    Value<int>? longestStreak,
    Value<DateTime?>? lastActivityDate,
    Value<int>? freezesAvailable,
    Value<int>? rowid,
  }) {
    return StreaksCompanion(
      languageCode: languageCode ?? this.languageCode,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastActivityDate: lastActivityDate ?? this.lastActivityDate,
      freezesAvailable: freezesAvailable ?? this.freezesAvailable,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (currentStreak.present) {
      map['current_streak'] = Variable<int>(currentStreak.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (lastActivityDate.present) {
      map['last_activity_date'] = Variable<DateTime>(lastActivityDate.value);
    }
    if (freezesAvailable.present) {
      map['freezes_available'] = Variable<int>(freezesAvailable.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StreaksCompanion(')
          ..write('languageCode: $languageCode, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastActivityDate: $lastActivityDate, ')
          ..write('freezesAvailable: $freezesAvailable, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActiveLessonsTable extends ActiveLessons
    with TableInfo<$ActiveLessonsTable, ActiveLesson> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActiveLessonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packIdMeta = const VerificationMeta('packId');
  @override
  late final GeneratedColumn<String> packId = GeneratedColumn<String>(
    'pack_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phraseIdsJsonMeta = const VerificationMeta(
    'phraseIdsJson',
  );
  @override
  late final GeneratedColumn<String> phraseIdsJson = GeneratedColumn<String>(
    'phrase_ids_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentIndexMeta = const VerificationMeta(
    'currentIndex',
  );
  @override
  late final GeneratedColumn<int> currentIndex = GeneratedColumn<int>(
    'current_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    languageCode,
    packId,
    phraseIdsJson,
    currentIndex,
    startedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'active_lessons';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActiveLesson> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_languageCodeMeta);
    }
    if (data.containsKey('pack_id')) {
      context.handle(
        _packIdMeta,
        packId.isAcceptableOrUnknown(data['pack_id']!, _packIdMeta),
      );
    }
    if (data.containsKey('phrase_ids_json')) {
      context.handle(
        _phraseIdsJsonMeta,
        phraseIdsJson.isAcceptableOrUnknown(
          data['phrase_ids_json']!,
          _phraseIdsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phraseIdsJsonMeta);
    }
    if (data.containsKey('current_index')) {
      context.handle(
        _currentIndexMeta,
        currentIndex.isAcceptableOrUnknown(
          data['current_index']!,
          _currentIndexMeta,
        ),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActiveLesson map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActiveLesson(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      )!,
      packId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pack_id'],
      ),
      phraseIdsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phrase_ids_json'],
      )!,
      currentIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_index'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
    );
  }

  @override
  $ActiveLessonsTable createAlias(String alias) {
    return $ActiveLessonsTable(attachedDatabase, alias);
  }
}

class ActiveLesson extends DataClass implements Insertable<ActiveLesson> {
  final int id;
  final String sessionId;
  final String languageCode;
  final String? packId;
  final String phraseIdsJson;
  final int currentIndex;
  final DateTime startedAt;
  const ActiveLesson({
    required this.id,
    required this.sessionId,
    required this.languageCode,
    this.packId,
    required this.phraseIdsJson,
    required this.currentIndex,
    required this.startedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['language_code'] = Variable<String>(languageCode);
    if (!nullToAbsent || packId != null) {
      map['pack_id'] = Variable<String>(packId);
    }
    map['phrase_ids_json'] = Variable<String>(phraseIdsJson);
    map['current_index'] = Variable<int>(currentIndex);
    map['started_at'] = Variable<DateTime>(startedAt);
    return map;
  }

  ActiveLessonsCompanion toCompanion(bool nullToAbsent) {
    return ActiveLessonsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      languageCode: Value(languageCode),
      packId: packId == null && nullToAbsent
          ? const Value.absent()
          : Value(packId),
      phraseIdsJson: Value(phraseIdsJson),
      currentIndex: Value(currentIndex),
      startedAt: Value(startedAt),
    );
  }

  factory ActiveLesson.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActiveLesson(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
      packId: serializer.fromJson<String?>(json['packId']),
      phraseIdsJson: serializer.fromJson<String>(json['phraseIdsJson']),
      currentIndex: serializer.fromJson<int>(json['currentIndex']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'languageCode': serializer.toJson<String>(languageCode),
      'packId': serializer.toJson<String?>(packId),
      'phraseIdsJson': serializer.toJson<String>(phraseIdsJson),
      'currentIndex': serializer.toJson<int>(currentIndex),
      'startedAt': serializer.toJson<DateTime>(startedAt),
    };
  }

  ActiveLesson copyWith({
    int? id,
    String? sessionId,
    String? languageCode,
    Value<String?> packId = const Value.absent(),
    String? phraseIdsJson,
    int? currentIndex,
    DateTime? startedAt,
  }) => ActiveLesson(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    languageCode: languageCode ?? this.languageCode,
    packId: packId.present ? packId.value : this.packId,
    phraseIdsJson: phraseIdsJson ?? this.phraseIdsJson,
    currentIndex: currentIndex ?? this.currentIndex,
    startedAt: startedAt ?? this.startedAt,
  );
  ActiveLesson copyWithCompanion(ActiveLessonsCompanion data) {
    return ActiveLesson(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      packId: data.packId.present ? data.packId.value : this.packId,
      phraseIdsJson: data.phraseIdsJson.present
          ? data.phraseIdsJson.value
          : this.phraseIdsJson,
      currentIndex: data.currentIndex.present
          ? data.currentIndex.value
          : this.currentIndex,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActiveLesson(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('languageCode: $languageCode, ')
          ..write('packId: $packId, ')
          ..write('phraseIdsJson: $phraseIdsJson, ')
          ..write('currentIndex: $currentIndex, ')
          ..write('startedAt: $startedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    languageCode,
    packId,
    phraseIdsJson,
    currentIndex,
    startedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActiveLesson &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.languageCode == this.languageCode &&
          other.packId == this.packId &&
          other.phraseIdsJson == this.phraseIdsJson &&
          other.currentIndex == this.currentIndex &&
          other.startedAt == this.startedAt);
}

class ActiveLessonsCompanion extends UpdateCompanion<ActiveLesson> {
  final Value<int> id;
  final Value<String> sessionId;
  final Value<String> languageCode;
  final Value<String?> packId;
  final Value<String> phraseIdsJson;
  final Value<int> currentIndex;
  final Value<DateTime> startedAt;
  const ActiveLessonsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.packId = const Value.absent(),
    this.phraseIdsJson = const Value.absent(),
    this.currentIndex = const Value.absent(),
    this.startedAt = const Value.absent(),
  });
  ActiveLessonsCompanion.insert({
    this.id = const Value.absent(),
    required String sessionId,
    required String languageCode,
    this.packId = const Value.absent(),
    required String phraseIdsJson,
    this.currentIndex = const Value.absent(),
    required DateTime startedAt,
  }) : sessionId = Value(sessionId),
       languageCode = Value(languageCode),
       phraseIdsJson = Value(phraseIdsJson),
       startedAt = Value(startedAt);
  static Insertable<ActiveLesson> custom({
    Expression<int>? id,
    Expression<String>? sessionId,
    Expression<String>? languageCode,
    Expression<String>? packId,
    Expression<String>? phraseIdsJson,
    Expression<int>? currentIndex,
    Expression<DateTime>? startedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (languageCode != null) 'language_code': languageCode,
      if (packId != null) 'pack_id': packId,
      if (phraseIdsJson != null) 'phrase_ids_json': phraseIdsJson,
      if (currentIndex != null) 'current_index': currentIndex,
      if (startedAt != null) 'started_at': startedAt,
    });
  }

  ActiveLessonsCompanion copyWith({
    Value<int>? id,
    Value<String>? sessionId,
    Value<String>? languageCode,
    Value<String?>? packId,
    Value<String>? phraseIdsJson,
    Value<int>? currentIndex,
    Value<DateTime>? startedAt,
  }) {
    return ActiveLessonsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      languageCode: languageCode ?? this.languageCode,
      packId: packId ?? this.packId,
      phraseIdsJson: phraseIdsJson ?? this.phraseIdsJson,
      currentIndex: currentIndex ?? this.currentIndex,
      startedAt: startedAt ?? this.startedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (packId.present) {
      map['pack_id'] = Variable<String>(packId.value);
    }
    if (phraseIdsJson.present) {
      map['phrase_ids_json'] = Variable<String>(phraseIdsJson.value);
    }
    if (currentIndex.present) {
      map['current_index'] = Variable<int>(currentIndex.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActiveLessonsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('languageCode: $languageCode, ')
          ..write('packId: $packId, ')
          ..write('phraseIdsJson: $phraseIdsJson, ')
          ..write('currentIndex: $currentIndex, ')
          ..write('startedAt: $startedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LanguagesTable languages = $LanguagesTable(this);
  late final $TopicPacksTable topicPacks = $TopicPacksTable(this);
  late final $PhrasesTable phrases = $PhrasesTable(this);
  late final $UserPreferencesTable userPreferences = $UserPreferencesTable(
    this,
  );
  late final $CardProgressTable cardProgress = $CardProgressTable(this);
  late final $LessonSessionsTable lessonSessions = $LessonSessionsTable(this);
  late final $StreaksTable streaks = $StreaksTable(this);
  late final $ActiveLessonsTable activeLessons = $ActiveLessonsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    languages,
    topicPacks,
    phrases,
    userPreferences,
    cardProgress,
    lessonSessions,
    streaks,
    activeLessons,
  ];
}

typedef $$LanguagesTableCreateCompanionBuilder =
    LanguagesCompanion Function({
      required String code,
      required String englishName,
      required String nativeName,
      required String flag,
      Value<int> rowid,
    });
typedef $$LanguagesTableUpdateCompanionBuilder =
    LanguagesCompanion Function({
      Value<String> code,
      Value<String> englishName,
      Value<String> nativeName,
      Value<String> flag,
      Value<int> rowid,
    });

class $$LanguagesTableFilterComposer
    extends Composer<_$AppDatabase, $LanguagesTable> {
  $$LanguagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nativeName => $composableBuilder(
    column: $table.nativeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get flag => $composableBuilder(
    column: $table.flag,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LanguagesTableOrderingComposer
    extends Composer<_$AppDatabase, $LanguagesTable> {
  $$LanguagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nativeName => $composableBuilder(
    column: $table.nativeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get flag => $composableBuilder(
    column: $table.flag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LanguagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LanguagesTable> {
  $$LanguagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nativeName => $composableBuilder(
    column: $table.nativeName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get flag =>
      $composableBuilder(column: $table.flag, builder: (column) => column);
}

class $$LanguagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LanguagesTable,
          Language,
          $$LanguagesTableFilterComposer,
          $$LanguagesTableOrderingComposer,
          $$LanguagesTableAnnotationComposer,
          $$LanguagesTableCreateCompanionBuilder,
          $$LanguagesTableUpdateCompanionBuilder,
          (Language, BaseReferences<_$AppDatabase, $LanguagesTable, Language>),
          Language,
          PrefetchHooks Function()
        > {
  $$LanguagesTableTableManager(_$AppDatabase db, $LanguagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LanguagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LanguagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LanguagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> code = const Value.absent(),
                Value<String> englishName = const Value.absent(),
                Value<String> nativeName = const Value.absent(),
                Value<String> flag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LanguagesCompanion(
                code: code,
                englishName: englishName,
                nativeName: nativeName,
                flag: flag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String code,
                required String englishName,
                required String nativeName,
                required String flag,
                Value<int> rowid = const Value.absent(),
              }) => LanguagesCompanion.insert(
                code: code,
                englishName: englishName,
                nativeName: nativeName,
                flag: flag,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LanguagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LanguagesTable,
      Language,
      $$LanguagesTableFilterComposer,
      $$LanguagesTableOrderingComposer,
      $$LanguagesTableAnnotationComposer,
      $$LanguagesTableCreateCompanionBuilder,
      $$LanguagesTableUpdateCompanionBuilder,
      (Language, BaseReferences<_$AppDatabase, $LanguagesTable, Language>),
      Language,
      PrefetchHooks Function()
    >;
typedef $$TopicPacksTableCreateCompanionBuilder =
    TopicPacksCompanion Function({
      required String id,
      required String languageCode,
      required String slug,
      required String name,
      required String emoji,
      Value<int> displayOrder,
      Value<int> rowid,
    });
typedef $$TopicPacksTableUpdateCompanionBuilder =
    TopicPacksCompanion Function({
      Value<String> id,
      Value<String> languageCode,
      Value<String> slug,
      Value<String> name,
      Value<String> emoji,
      Value<int> displayOrder,
      Value<int> rowid,
    });

class $$TopicPacksTableFilterComposer
    extends Composer<_$AppDatabase, $TopicPacksTable> {
  $$TopicPacksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TopicPacksTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicPacksTable> {
  $$TopicPacksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TopicPacksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicPacksTable> {
  $$TopicPacksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => column,
  );
}

class $$TopicPacksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TopicPacksTable,
          TopicPack,
          $$TopicPacksTableFilterComposer,
          $$TopicPacksTableOrderingComposer,
          $$TopicPacksTableAnnotationComposer,
          $$TopicPacksTableCreateCompanionBuilder,
          $$TopicPacksTableUpdateCompanionBuilder,
          (
            TopicPack,
            BaseReferences<_$AppDatabase, $TopicPacksTable, TopicPack>,
          ),
          TopicPack,
          PrefetchHooks Function()
        > {
  $$TopicPacksTableTableManager(_$AppDatabase db, $TopicPacksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicPacksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicPacksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicPacksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<int> displayOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TopicPacksCompanion(
                id: id,
                languageCode: languageCode,
                slug: slug,
                name: name,
                emoji: emoji,
                displayOrder: displayOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String languageCode,
                required String slug,
                required String name,
                required String emoji,
                Value<int> displayOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TopicPacksCompanion.insert(
                id: id,
                languageCode: languageCode,
                slug: slug,
                name: name,
                emoji: emoji,
                displayOrder: displayOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TopicPacksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TopicPacksTable,
      TopicPack,
      $$TopicPacksTableFilterComposer,
      $$TopicPacksTableOrderingComposer,
      $$TopicPacksTableAnnotationComposer,
      $$TopicPacksTableCreateCompanionBuilder,
      $$TopicPacksTableUpdateCompanionBuilder,
      (TopicPack, BaseReferences<_$AppDatabase, $TopicPacksTable, TopicPack>),
      TopicPack,
      PrefetchHooks Function()
    >;
typedef $$PhrasesTableCreateCompanionBuilder =
    PhrasesCompanion Function({
      required String id,
      required String packId,
      required String languageCode,
      required String nativePrompt,
      required String targetText,
      Value<String?> pronunciation,
      Value<String?> audioPath,
      Value<int> displayOrder,
      Value<int> rowid,
    });
typedef $$PhrasesTableUpdateCompanionBuilder =
    PhrasesCompanion Function({
      Value<String> id,
      Value<String> packId,
      Value<String> languageCode,
      Value<String> nativePrompt,
      Value<String> targetText,
      Value<String?> pronunciation,
      Value<String?> audioPath,
      Value<int> displayOrder,
      Value<int> rowid,
    });

class $$PhrasesTableFilterComposer
    extends Composer<_$AppDatabase, $PhrasesTable> {
  $$PhrasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get packId => $composableBuilder(
    column: $table.packId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nativePrompt => $composableBuilder(
    column: $table.nativePrompt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetText => $composableBuilder(
    column: $table.targetText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pronunciation => $composableBuilder(
    column: $table.pronunciation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioPath => $composableBuilder(
    column: $table.audioPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PhrasesTableOrderingComposer
    extends Composer<_$AppDatabase, $PhrasesTable> {
  $$PhrasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get packId => $composableBuilder(
    column: $table.packId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nativePrompt => $composableBuilder(
    column: $table.nativePrompt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetText => $composableBuilder(
    column: $table.targetText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pronunciation => $composableBuilder(
    column: $table.pronunciation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioPath => $composableBuilder(
    column: $table.audioPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PhrasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhrasesTable> {
  $$PhrasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get packId =>
      $composableBuilder(column: $table.packId, builder: (column) => column);

  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nativePrompt => $composableBuilder(
    column: $table.nativePrompt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetText => $composableBuilder(
    column: $table.targetText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pronunciation => $composableBuilder(
    column: $table.pronunciation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get audioPath =>
      $composableBuilder(column: $table.audioPath, builder: (column) => column);

  GeneratedColumn<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => column,
  );
}

class $$PhrasesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhrasesTable,
          Phrase,
          $$PhrasesTableFilterComposer,
          $$PhrasesTableOrderingComposer,
          $$PhrasesTableAnnotationComposer,
          $$PhrasesTableCreateCompanionBuilder,
          $$PhrasesTableUpdateCompanionBuilder,
          (Phrase, BaseReferences<_$AppDatabase, $PhrasesTable, Phrase>),
          Phrase,
          PrefetchHooks Function()
        > {
  $$PhrasesTableTableManager(_$AppDatabase db, $PhrasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhrasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhrasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhrasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> packId = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<String> nativePrompt = const Value.absent(),
                Value<String> targetText = const Value.absent(),
                Value<String?> pronunciation = const Value.absent(),
                Value<String?> audioPath = const Value.absent(),
                Value<int> displayOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhrasesCompanion(
                id: id,
                packId: packId,
                languageCode: languageCode,
                nativePrompt: nativePrompt,
                targetText: targetText,
                pronunciation: pronunciation,
                audioPath: audioPath,
                displayOrder: displayOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String packId,
                required String languageCode,
                required String nativePrompt,
                required String targetText,
                Value<String?> pronunciation = const Value.absent(),
                Value<String?> audioPath = const Value.absent(),
                Value<int> displayOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhrasesCompanion.insert(
                id: id,
                packId: packId,
                languageCode: languageCode,
                nativePrompt: nativePrompt,
                targetText: targetText,
                pronunciation: pronunciation,
                audioPath: audioPath,
                displayOrder: displayOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PhrasesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhrasesTable,
      Phrase,
      $$PhrasesTableFilterComposer,
      $$PhrasesTableOrderingComposer,
      $$PhrasesTableAnnotationComposer,
      $$PhrasesTableCreateCompanionBuilder,
      $$PhrasesTableUpdateCompanionBuilder,
      (Phrase, BaseReferences<_$AppDatabase, $PhrasesTable, Phrase>),
      Phrase,
      PrefetchHooks Function()
    >;
typedef $$UserPreferencesTableCreateCompanionBuilder =
    UserPreferencesCompanion Function({
      Value<int> id,
      Value<String?> activeLanguageCode,
      Value<int> dailyGoalMinutes,
      Value<String> themeMode,
      Value<bool> notificationsEnabled,
      Value<DateTime?> onboardedAt,
      Value<DateTime?> lastQuizAt,
    });
typedef $$UserPreferencesTableUpdateCompanionBuilder =
    UserPreferencesCompanion Function({
      Value<int> id,
      Value<String?> activeLanguageCode,
      Value<int> dailyGoalMinutes,
      Value<String> themeMode,
      Value<bool> notificationsEnabled,
      Value<DateTime?> onboardedAt,
      Value<DateTime?> lastQuizAt,
    });

class $$UserPreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $UserPreferencesTable> {
  $$UserPreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activeLanguageCode => $composableBuilder(
    column: $table.activeLanguageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyGoalMinutes => $composableBuilder(
    column: $table.dailyGoalMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get onboardedAt => $composableBuilder(
    column: $table.onboardedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastQuizAt => $composableBuilder(
    column: $table.lastQuizAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserPreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserPreferencesTable> {
  $$UserPreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activeLanguageCode => $composableBuilder(
    column: $table.activeLanguageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyGoalMinutes => $composableBuilder(
    column: $table.dailyGoalMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get onboardedAt => $composableBuilder(
    column: $table.onboardedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastQuizAt => $composableBuilder(
    column: $table.lastQuizAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserPreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserPreferencesTable> {
  $$UserPreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get activeLanguageCode => $composableBuilder(
    column: $table.activeLanguageCode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dailyGoalMinutes => $composableBuilder(
    column: $table.dailyGoalMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get onboardedAt => $composableBuilder(
    column: $table.onboardedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastQuizAt => $composableBuilder(
    column: $table.lastQuizAt,
    builder: (column) => column,
  );
}

class $$UserPreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserPreferencesTable,
          UserPreference,
          $$UserPreferencesTableFilterComposer,
          $$UserPreferencesTableOrderingComposer,
          $$UserPreferencesTableAnnotationComposer,
          $$UserPreferencesTableCreateCompanionBuilder,
          $$UserPreferencesTableUpdateCompanionBuilder,
          (
            UserPreference,
            BaseReferences<
              _$AppDatabase,
              $UserPreferencesTable,
              UserPreference
            >,
          ),
          UserPreference,
          PrefetchHooks Function()
        > {
  $$UserPreferencesTableTableManager(
    _$AppDatabase db,
    $UserPreferencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserPreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserPreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserPreferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> activeLanguageCode = const Value.absent(),
                Value<int> dailyGoalMinutes = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<DateTime?> onboardedAt = const Value.absent(),
                Value<DateTime?> lastQuizAt = const Value.absent(),
              }) => UserPreferencesCompanion(
                id: id,
                activeLanguageCode: activeLanguageCode,
                dailyGoalMinutes: dailyGoalMinutes,
                themeMode: themeMode,
                notificationsEnabled: notificationsEnabled,
                onboardedAt: onboardedAt,
                lastQuizAt: lastQuizAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> activeLanguageCode = const Value.absent(),
                Value<int> dailyGoalMinutes = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<DateTime?> onboardedAt = const Value.absent(),
                Value<DateTime?> lastQuizAt = const Value.absent(),
              }) => UserPreferencesCompanion.insert(
                id: id,
                activeLanguageCode: activeLanguageCode,
                dailyGoalMinutes: dailyGoalMinutes,
                themeMode: themeMode,
                notificationsEnabled: notificationsEnabled,
                onboardedAt: onboardedAt,
                lastQuizAt: lastQuizAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserPreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserPreferencesTable,
      UserPreference,
      $$UserPreferencesTableFilterComposer,
      $$UserPreferencesTableOrderingComposer,
      $$UserPreferencesTableAnnotationComposer,
      $$UserPreferencesTableCreateCompanionBuilder,
      $$UserPreferencesTableUpdateCompanionBuilder,
      (
        UserPreference,
        BaseReferences<_$AppDatabase, $UserPreferencesTable, UserPreference>,
      ),
      UserPreference,
      PrefetchHooks Function()
    >;
typedef $$CardProgressTableCreateCompanionBuilder =
    CardProgressCompanion Function({
      required String phraseId,
      required String languageCode,
      Value<double> easeFactor,
      Value<int> intervalDays,
      Value<int> repetitions,
      Value<DateTime?> nextDueAt,
      Value<DateTime?> lastReviewedAt,
      Value<int> totalReviews,
      Value<int> rowid,
    });
typedef $$CardProgressTableUpdateCompanionBuilder =
    CardProgressCompanion Function({
      Value<String> phraseId,
      Value<String> languageCode,
      Value<double> easeFactor,
      Value<int> intervalDays,
      Value<int> repetitions,
      Value<DateTime?> nextDueAt,
      Value<DateTime?> lastReviewedAt,
      Value<int> totalReviews,
      Value<int> rowid,
    });

class $$CardProgressTableFilterComposer
    extends Composer<_$AppDatabase, $CardProgressTable> {
  $$CardProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get phraseId => $composableBuilder(
    column: $table.phraseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextDueAt => $composableBuilder(
    column: $table.nextDueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalReviews => $composableBuilder(
    column: $table.totalReviews,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CardProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $CardProgressTable> {
  $$CardProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get phraseId => $composableBuilder(
    column: $table.phraseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextDueAt => $composableBuilder(
    column: $table.nextDueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalReviews => $composableBuilder(
    column: $table.totalReviews,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CardProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardProgressTable> {
  $$CardProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get phraseId =>
      $composableBuilder(column: $table.phraseId, builder: (column) => column);

  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );

  GeneratedColumn<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextDueAt =>
      $composableBuilder(column: $table.nextDueAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalReviews => $composableBuilder(
    column: $table.totalReviews,
    builder: (column) => column,
  );
}

class $$CardProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CardProgressTable,
          CardProgressData,
          $$CardProgressTableFilterComposer,
          $$CardProgressTableOrderingComposer,
          $$CardProgressTableAnnotationComposer,
          $$CardProgressTableCreateCompanionBuilder,
          $$CardProgressTableUpdateCompanionBuilder,
          (
            CardProgressData,
            BaseReferences<_$AppDatabase, $CardProgressTable, CardProgressData>,
          ),
          CardProgressData,
          PrefetchHooks Function()
        > {
  $$CardProgressTableTableManager(_$AppDatabase db, $CardProgressTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> phraseId = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> intervalDays = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                Value<DateTime?> nextDueAt = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<int> totalReviews = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardProgressCompanion(
                phraseId: phraseId,
                languageCode: languageCode,
                easeFactor: easeFactor,
                intervalDays: intervalDays,
                repetitions: repetitions,
                nextDueAt: nextDueAt,
                lastReviewedAt: lastReviewedAt,
                totalReviews: totalReviews,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String phraseId,
                required String languageCode,
                Value<double> easeFactor = const Value.absent(),
                Value<int> intervalDays = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                Value<DateTime?> nextDueAt = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<int> totalReviews = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardProgressCompanion.insert(
                phraseId: phraseId,
                languageCode: languageCode,
                easeFactor: easeFactor,
                intervalDays: intervalDays,
                repetitions: repetitions,
                nextDueAt: nextDueAt,
                lastReviewedAt: lastReviewedAt,
                totalReviews: totalReviews,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CardProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CardProgressTable,
      CardProgressData,
      $$CardProgressTableFilterComposer,
      $$CardProgressTableOrderingComposer,
      $$CardProgressTableAnnotationComposer,
      $$CardProgressTableCreateCompanionBuilder,
      $$CardProgressTableUpdateCompanionBuilder,
      (
        CardProgressData,
        BaseReferences<_$AppDatabase, $CardProgressTable, CardProgressData>,
      ),
      CardProgressData,
      PrefetchHooks Function()
    >;
typedef $$LessonSessionsTableCreateCompanionBuilder =
    LessonSessionsCompanion Function({
      required String id,
      required String languageCode,
      Value<String?> packId,
      required DateTime startedAt,
      Value<DateTime?> endedAt,
      Value<int> cardsReviewed,
      Value<int> durationSeconds,
      Value<int> rowid,
    });
typedef $$LessonSessionsTableUpdateCompanionBuilder =
    LessonSessionsCompanion Function({
      Value<String> id,
      Value<String> languageCode,
      Value<String?> packId,
      Value<DateTime> startedAt,
      Value<DateTime?> endedAt,
      Value<int> cardsReviewed,
      Value<int> durationSeconds,
      Value<int> rowid,
    });

class $$LessonSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $LessonSessionsTable> {
  $$LessonSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get packId => $composableBuilder(
    column: $table.packId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cardsReviewed => $composableBuilder(
    column: $table.cardsReviewed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LessonSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $LessonSessionsTable> {
  $$LessonSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get packId => $composableBuilder(
    column: $table.packId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cardsReviewed => $composableBuilder(
    column: $table.cardsReviewed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LessonSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LessonSessionsTable> {
  $$LessonSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get packId =>
      $composableBuilder(column: $table.packId, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<int> get cardsReviewed => $composableBuilder(
    column: $table.cardsReviewed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );
}

class $$LessonSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LessonSessionsTable,
          LessonSession,
          $$LessonSessionsTableFilterComposer,
          $$LessonSessionsTableOrderingComposer,
          $$LessonSessionsTableAnnotationComposer,
          $$LessonSessionsTableCreateCompanionBuilder,
          $$LessonSessionsTableUpdateCompanionBuilder,
          (
            LessonSession,
            BaseReferences<_$AppDatabase, $LessonSessionsTable, LessonSession>,
          ),
          LessonSession,
          PrefetchHooks Function()
        > {
  $$LessonSessionsTableTableManager(
    _$AppDatabase db,
    $LessonSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LessonSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<String?> packId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> cardsReviewed = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonSessionsCompanion(
                id: id,
                languageCode: languageCode,
                packId: packId,
                startedAt: startedAt,
                endedAt: endedAt,
                cardsReviewed: cardsReviewed,
                durationSeconds: durationSeconds,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String languageCode,
                Value<String?> packId = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> cardsReviewed = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonSessionsCompanion.insert(
                id: id,
                languageCode: languageCode,
                packId: packId,
                startedAt: startedAt,
                endedAt: endedAt,
                cardsReviewed: cardsReviewed,
                durationSeconds: durationSeconds,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LessonSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LessonSessionsTable,
      LessonSession,
      $$LessonSessionsTableFilterComposer,
      $$LessonSessionsTableOrderingComposer,
      $$LessonSessionsTableAnnotationComposer,
      $$LessonSessionsTableCreateCompanionBuilder,
      $$LessonSessionsTableUpdateCompanionBuilder,
      (
        LessonSession,
        BaseReferences<_$AppDatabase, $LessonSessionsTable, LessonSession>,
      ),
      LessonSession,
      PrefetchHooks Function()
    >;
typedef $$StreaksTableCreateCompanionBuilder =
    StreaksCompanion Function({
      required String languageCode,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<DateTime?> lastActivityDate,
      Value<int> freezesAvailable,
      Value<int> rowid,
    });
typedef $$StreaksTableUpdateCompanionBuilder =
    StreaksCompanion Function({
      Value<String> languageCode,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<DateTime?> lastActivityDate,
      Value<int> freezesAvailable,
      Value<int> rowid,
    });

class $$StreaksTableFilterComposer
    extends Composer<_$AppDatabase, $StreaksTable> {
  $$StreaksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastActivityDate => $composableBuilder(
    column: $table.lastActivityDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get freezesAvailable => $composableBuilder(
    column: $table.freezesAvailable,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StreaksTableOrderingComposer
    extends Composer<_$AppDatabase, $StreaksTable> {
  $$StreaksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastActivityDate => $composableBuilder(
    column: $table.lastActivityDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get freezesAvailable => $composableBuilder(
    column: $table.freezesAvailable,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StreaksTableAnnotationComposer
    extends Composer<_$AppDatabase, $StreaksTable> {
  $$StreaksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => column,
  );

  GeneratedColumn<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastActivityDate => $composableBuilder(
    column: $table.lastActivityDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get freezesAvailable => $composableBuilder(
    column: $table.freezesAvailable,
    builder: (column) => column,
  );
}

class $$StreaksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StreaksTable,
          Streak,
          $$StreaksTableFilterComposer,
          $$StreaksTableOrderingComposer,
          $$StreaksTableAnnotationComposer,
          $$StreaksTableCreateCompanionBuilder,
          $$StreaksTableUpdateCompanionBuilder,
          (Streak, BaseReferences<_$AppDatabase, $StreaksTable, Streak>),
          Streak,
          PrefetchHooks Function()
        > {
  $$StreaksTableTableManager(_$AppDatabase db, $StreaksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StreaksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StreaksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StreaksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> languageCode = const Value.absent(),
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<DateTime?> lastActivityDate = const Value.absent(),
                Value<int> freezesAvailable = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StreaksCompanion(
                languageCode: languageCode,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                lastActivityDate: lastActivityDate,
                freezesAvailable: freezesAvailable,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String languageCode,
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<DateTime?> lastActivityDate = const Value.absent(),
                Value<int> freezesAvailable = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StreaksCompanion.insert(
                languageCode: languageCode,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                lastActivityDate: lastActivityDate,
                freezesAvailable: freezesAvailable,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StreaksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StreaksTable,
      Streak,
      $$StreaksTableFilterComposer,
      $$StreaksTableOrderingComposer,
      $$StreaksTableAnnotationComposer,
      $$StreaksTableCreateCompanionBuilder,
      $$StreaksTableUpdateCompanionBuilder,
      (Streak, BaseReferences<_$AppDatabase, $StreaksTable, Streak>),
      Streak,
      PrefetchHooks Function()
    >;
typedef $$ActiveLessonsTableCreateCompanionBuilder =
    ActiveLessonsCompanion Function({
      Value<int> id,
      required String sessionId,
      required String languageCode,
      Value<String?> packId,
      required String phraseIdsJson,
      Value<int> currentIndex,
      required DateTime startedAt,
    });
typedef $$ActiveLessonsTableUpdateCompanionBuilder =
    ActiveLessonsCompanion Function({
      Value<int> id,
      Value<String> sessionId,
      Value<String> languageCode,
      Value<String?> packId,
      Value<String> phraseIdsJson,
      Value<int> currentIndex,
      Value<DateTime> startedAt,
    });

class $$ActiveLessonsTableFilterComposer
    extends Composer<_$AppDatabase, $ActiveLessonsTable> {
  $$ActiveLessonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get packId => $composableBuilder(
    column: $table.packId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phraseIdsJson => $composableBuilder(
    column: $table.phraseIdsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActiveLessonsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActiveLessonsTable> {
  $$ActiveLessonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get packId => $composableBuilder(
    column: $table.packId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phraseIdsJson => $composableBuilder(
    column: $table.phraseIdsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActiveLessonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActiveLessonsTable> {
  $$ActiveLessonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get packId =>
      $composableBuilder(column: $table.packId, builder: (column) => column);

  GeneratedColumn<String> get phraseIdsJson => $composableBuilder(
    column: $table.phraseIdsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);
}

class $$ActiveLessonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActiveLessonsTable,
          ActiveLesson,
          $$ActiveLessonsTableFilterComposer,
          $$ActiveLessonsTableOrderingComposer,
          $$ActiveLessonsTableAnnotationComposer,
          $$ActiveLessonsTableCreateCompanionBuilder,
          $$ActiveLessonsTableUpdateCompanionBuilder,
          (
            ActiveLesson,
            BaseReferences<_$AppDatabase, $ActiveLessonsTable, ActiveLesson>,
          ),
          ActiveLesson,
          PrefetchHooks Function()
        > {
  $$ActiveLessonsTableTableManager(_$AppDatabase db, $ActiveLessonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActiveLessonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActiveLessonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActiveLessonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<String?> packId = const Value.absent(),
                Value<String> phraseIdsJson = const Value.absent(),
                Value<int> currentIndex = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
              }) => ActiveLessonsCompanion(
                id: id,
                sessionId: sessionId,
                languageCode: languageCode,
                packId: packId,
                phraseIdsJson: phraseIdsJson,
                currentIndex: currentIndex,
                startedAt: startedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String sessionId,
                required String languageCode,
                Value<String?> packId = const Value.absent(),
                required String phraseIdsJson,
                Value<int> currentIndex = const Value.absent(),
                required DateTime startedAt,
              }) => ActiveLessonsCompanion.insert(
                id: id,
                sessionId: sessionId,
                languageCode: languageCode,
                packId: packId,
                phraseIdsJson: phraseIdsJson,
                currentIndex: currentIndex,
                startedAt: startedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActiveLessonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActiveLessonsTable,
      ActiveLesson,
      $$ActiveLessonsTableFilterComposer,
      $$ActiveLessonsTableOrderingComposer,
      $$ActiveLessonsTableAnnotationComposer,
      $$ActiveLessonsTableCreateCompanionBuilder,
      $$ActiveLessonsTableUpdateCompanionBuilder,
      (
        ActiveLesson,
        BaseReferences<_$AppDatabase, $ActiveLessonsTable, ActiveLesson>,
      ),
      ActiveLesson,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LanguagesTableTableManager get languages =>
      $$LanguagesTableTableManager(_db, _db.languages);
  $$TopicPacksTableTableManager get topicPacks =>
      $$TopicPacksTableTableManager(_db, _db.topicPacks);
  $$PhrasesTableTableManager get phrases =>
      $$PhrasesTableTableManager(_db, _db.phrases);
  $$UserPreferencesTableTableManager get userPreferences =>
      $$UserPreferencesTableTableManager(_db, _db.userPreferences);
  $$CardProgressTableTableManager get cardProgress =>
      $$CardProgressTableTableManager(_db, _db.cardProgress);
  $$LessonSessionsTableTableManager get lessonSessions =>
      $$LessonSessionsTableTableManager(_db, _db.lessonSessions);
  $$StreaksTableTableManager get streaks =>
      $$StreaksTableTableManager(_db, _db.streaks);
  $$ActiveLessonsTableTableManager get activeLessons =>
      $$ActiveLessonsTableTableManager(_db, _db.activeLessons);
}
