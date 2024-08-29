// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTopicModelCollection on Isar {
  IsarCollection<TopicModel> get topicModels => this.collection();
}

const TopicModelSchema = CollectionSchema(
  name: r'TopicModel',
  id: -634589795994312055,
  properties: {
    r'icon': PropertySchema(
      id: 0,
      name: r'icon',
      type: IsarType.string,
    ),
    r'textEn': PropertySchema(
      id: 1,
      name: r'textEn',
      type: IsarType.string,
    ),
    r'textFi': PropertySchema(
      id: 2,
      name: r'textFi',
      type: IsarType.string,
    ),
    r'textSv': PropertySchema(
      id: 3,
      name: r'textSv',
      type: IsarType.string,
    )
  },
  estimateSize: _topicModelEstimateSize,
  serialize: _topicModelSerialize,
  deserialize: _topicModelDeserialize,
  deserializeProp: _topicModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _topicModelGetId,
  getLinks: _topicModelGetLinks,
  attach: _topicModelAttach,
  version: '3.1.0+1',
);

int _topicModelEstimateSize(
  TopicModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.icon.length * 3;
  bytesCount += 3 + object.textEn.length * 3;
  bytesCount += 3 + object.textFi.length * 3;
  bytesCount += 3 + object.textSv.length * 3;
  return bytesCount;
}

void _topicModelSerialize(
  TopicModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.icon);
  writer.writeString(offsets[1], object.textEn);
  writer.writeString(offsets[2], object.textFi);
  writer.writeString(offsets[3], object.textSv);
}

TopicModel _topicModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TopicModel(
    icon: reader.readString(offsets[0]),
    textEn: reader.readString(offsets[1]),
    textFi: reader.readString(offsets[2]),
    textSv: reader.readString(offsets[3]),
  );
  object.id = id;
  return object;
}

P _topicModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _topicModelGetId(TopicModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _topicModelGetLinks(TopicModel object) {
  return [];
}

void _topicModelAttach(IsarCollection<dynamic> col, Id id, TopicModel object) {
  object.id = id;
}

extension TopicModelQueryWhereSort
    on QueryBuilder<TopicModel, TopicModel, QWhere> {
  QueryBuilder<TopicModel, TopicModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TopicModelQueryWhere
    on QueryBuilder<TopicModel, TopicModel, QWhereClause> {
  QueryBuilder<TopicModel, TopicModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TopicModelQueryFilter
    on QueryBuilder<TopicModel, TopicModel, QFilterCondition> {
  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> iconEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> iconGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> iconLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> iconBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'icon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> iconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> iconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> iconContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> iconMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'icon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> iconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> iconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textEnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textEn',
        value: '',
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition>
      textEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textEn',
        value: '',
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textFiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textFiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textFiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textFiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textFi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textFiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textFiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textFiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textFiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textFi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textFiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textFi',
        value: '',
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition>
      textFiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textFi',
        value: '',
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textSvEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textSvGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textSvLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textSvBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textSv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textSvStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textSvEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textSvContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textSvMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textSv',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition> textSvIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textSv',
        value: '',
      ));
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterFilterCondition>
      textSvIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textSv',
        value: '',
      ));
    });
  }
}

extension TopicModelQueryObject
    on QueryBuilder<TopicModel, TopicModel, QFilterCondition> {}

extension TopicModelQueryLinks
    on QueryBuilder<TopicModel, TopicModel, QFilterCondition> {}

extension TopicModelQuerySortBy
    on QueryBuilder<TopicModel, TopicModel, QSortBy> {
  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> sortByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> sortByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> sortByTextEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textEn', Sort.asc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> sortByTextEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textEn', Sort.desc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> sortByTextFi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textFi', Sort.asc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> sortByTextFiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textFi', Sort.desc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> sortByTextSv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSv', Sort.asc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> sortByTextSvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSv', Sort.desc);
    });
  }
}

extension TopicModelQuerySortThenBy
    on QueryBuilder<TopicModel, TopicModel, QSortThenBy> {
  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> thenByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> thenByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> thenByTextEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textEn', Sort.asc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> thenByTextEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textEn', Sort.desc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> thenByTextFi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textFi', Sort.asc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> thenByTextFiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textFi', Sort.desc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> thenByTextSv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSv', Sort.asc);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QAfterSortBy> thenByTextSvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSv', Sort.desc);
    });
  }
}

extension TopicModelQueryWhereDistinct
    on QueryBuilder<TopicModel, TopicModel, QDistinct> {
  QueryBuilder<TopicModel, TopicModel, QDistinct> distinctByIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'icon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QDistinct> distinctByTextEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QDistinct> distinctByTextFi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textFi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TopicModel, TopicModel, QDistinct> distinctByTextSv(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textSv', caseSensitive: caseSensitive);
    });
  }
}

extension TopicModelQueryProperty
    on QueryBuilder<TopicModel, TopicModel, QQueryProperty> {
  QueryBuilder<TopicModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TopicModel, String, QQueryOperations> iconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'icon');
    });
  }

  QueryBuilder<TopicModel, String, QQueryOperations> textEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textEn');
    });
  }

  QueryBuilder<TopicModel, String, QQueryOperations> textFiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textFi');
    });
  }

  QueryBuilder<TopicModel, String, QQueryOperations> textSvProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textSv');
    });
  }
}
