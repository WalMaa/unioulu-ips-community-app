// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEventModelCollection on Isar {
  IsarCollection<EventModel> get eventModels => this.collection();
}

const EventModelSchema = CollectionSchema(
  name: r'EventModel',
  id: 3380270723020586526,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.string,
    ),
    r'detailsEn': PropertySchema(
      id: 2,
      name: r'detailsEn',
      type: IsarType.string,
    ),
    r'detailsFi': PropertySchema(
      id: 3,
      name: r'detailsFi',
      type: IsarType.string,
    ),
    r'detailsSv': PropertySchema(
      id: 4,
      name: r'detailsSv',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 5,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'locationEn': PropertySchema(
      id: 6,
      name: r'locationEn',
      type: IsarType.string,
    ),
    r'locationFi': PropertySchema(
      id: 7,
      name: r'locationFi',
      type: IsarType.string,
    ),
    r'locationSv': PropertySchema(
      id: 8,
      name: r'locationSv',
      type: IsarType.string,
    ),
    r'locationUrl': PropertySchema(
      id: 9,
      name: r'locationUrl',
      type: IsarType.string,
    ),
    r'organizerName': PropertySchema(
      id: 10,
      name: r'organizerName',
      type: IsarType.string,
    ),
    r'posterPhotoUrl': PropertySchema(
      id: 11,
      name: r'posterPhotoUrl',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 12,
      name: r'price',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 13,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'ticketDetailsEn': PropertySchema(
      id: 14,
      name: r'ticketDetailsEn',
      type: IsarType.string,
    ),
    r'ticketDetailsFi': PropertySchema(
      id: 15,
      name: r'ticketDetailsFi',
      type: IsarType.string,
    ),
    r'ticketDetailsSv': PropertySchema(
      id: 16,
      name: r'ticketDetailsSv',
      type: IsarType.string,
    ),
    r'time': PropertySchema(
      id: 17,
      name: r'time',
      type: IsarType.string,
    ),
    r'titleEn': PropertySchema(
      id: 18,
      name: r'titleEn',
      type: IsarType.string,
    ),
    r'titleFi': PropertySchema(
      id: 19,
      name: r'titleFi',
      type: IsarType.string,
    ),
    r'titleSv': PropertySchema(
      id: 20,
      name: r'titleSv',
      type: IsarType.string,
    ),
    r'topics': PropertySchema(
      id: 21,
      name: r'topics',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 22,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _eventModelEstimateSize,
  serialize: _eventModelSerialize,
  deserialize: _eventModelDeserialize,
  deserializeProp: _eventModelDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'remoteId': IndexSchema(
      id: 6301175856541681032,
      name: r'remoteId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'remoteId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _eventModelGetId,
  getLinks: _eventModelGetLinks,
  attach: _eventModelAttach,
  version: '3.1.0+1',
);

int _eventModelEstimateSize(
  EventModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  bytesCount += 3 + object.detailsEn.length * 3;
  bytesCount += 3 + object.detailsFi.length * 3;
  bytesCount += 3 + object.detailsSv.length * 3;
  bytesCount += 3 + object.locationEn.length * 3;
  bytesCount += 3 + object.locationFi.length * 3;
  bytesCount += 3 + object.locationSv.length * 3;
  bytesCount += 3 + object.locationUrl.length * 3;
  bytesCount += 3 + object.organizerName.length * 3;
  bytesCount += 3 + object.posterPhotoUrl.length * 3;
  bytesCount += 3 + object.price.length * 3;
  bytesCount += 3 + object.remoteId.length * 3;
  bytesCount += 3 + object.ticketDetailsEn.length * 3;
  bytesCount += 3 + object.ticketDetailsFi.length * 3;
  bytesCount += 3 + object.ticketDetailsSv.length * 3;
  bytesCount += 3 + object.time.length * 3;
  bytesCount += 3 + object.titleEn.length * 3;
  bytesCount += 3 + object.titleFi.length * 3;
  bytesCount += 3 + object.titleSv.length * 3;
  bytesCount += 3 + object.topics.length * 3;
  return bytesCount;
}

void _eventModelSerialize(
  EventModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.date);
  writer.writeString(offsets[2], object.detailsEn);
  writer.writeString(offsets[3], object.detailsFi);
  writer.writeString(offsets[4], object.detailsSv);
  writer.writeLong(offsets[5], object.hashCode);
  writer.writeString(offsets[6], object.locationEn);
  writer.writeString(offsets[7], object.locationFi);
  writer.writeString(offsets[8], object.locationSv);
  writer.writeString(offsets[9], object.locationUrl);
  writer.writeString(offsets[10], object.organizerName);
  writer.writeString(offsets[11], object.posterPhotoUrl);
  writer.writeString(offsets[12], object.price);
  writer.writeString(offsets[13], object.remoteId);
  writer.writeString(offsets[14], object.ticketDetailsEn);
  writer.writeString(offsets[15], object.ticketDetailsFi);
  writer.writeString(offsets[16], object.ticketDetailsSv);
  writer.writeString(offsets[17], object.time);
  writer.writeString(offsets[18], object.titleEn);
  writer.writeString(offsets[19], object.titleFi);
  writer.writeString(offsets[20], object.titleSv);
  writer.writeString(offsets[21], object.topics);
  writer.writeDateTime(offsets[22], object.updatedAt);
}

EventModel _eventModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EventModel();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.date = reader.readString(offsets[1]);
  object.detailsEn = reader.readString(offsets[2]);
  object.detailsFi = reader.readString(offsets[3]);
  object.detailsSv = reader.readString(offsets[4]);
  object.isarId = id;
  object.locationEn = reader.readString(offsets[6]);
  object.locationFi = reader.readString(offsets[7]);
  object.locationSv = reader.readString(offsets[8]);
  object.locationUrl = reader.readString(offsets[9]);
  object.organizerName = reader.readString(offsets[10]);
  object.posterPhotoUrl = reader.readString(offsets[11]);
  object.price = reader.readString(offsets[12]);
  object.remoteId = reader.readString(offsets[13]);
  object.ticketDetailsEn = reader.readString(offsets[14]);
  object.ticketDetailsFi = reader.readString(offsets[15]);
  object.ticketDetailsSv = reader.readString(offsets[16]);
  object.time = reader.readString(offsets[17]);
  object.titleEn = reader.readString(offsets[18]);
  object.titleFi = reader.readString(offsets[19]);
  object.titleSv = reader.readString(offsets[20]);
  object.topics = reader.readString(offsets[21]);
  object.updatedAt = reader.readDateTime(offsets[22]);
  return object;
}

P _eventModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _eventModelGetId(EventModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _eventModelGetLinks(EventModel object) {
  return [];
}

void _eventModelAttach(IsarCollection<dynamic> col, Id id, EventModel object) {
  object.isarId = id;
}

extension EventModelByIndex on IsarCollection<EventModel> {
  Future<EventModel?> getByRemoteId(String remoteId) {
    return getByIndex(r'remoteId', [remoteId]);
  }

  EventModel? getByRemoteIdSync(String remoteId) {
    return getByIndexSync(r'remoteId', [remoteId]);
  }

  Future<bool> deleteByRemoteId(String remoteId) {
    return deleteByIndex(r'remoteId', [remoteId]);
  }

  bool deleteByRemoteIdSync(String remoteId) {
    return deleteByIndexSync(r'remoteId', [remoteId]);
  }

  Future<List<EventModel?>> getAllByRemoteId(List<String> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'remoteId', values);
  }

  List<EventModel?> getAllByRemoteIdSync(List<String> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'remoteId', values);
  }

  Future<int> deleteAllByRemoteId(List<String> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'remoteId', values);
  }

  int deleteAllByRemoteIdSync(List<String> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'remoteId', values);
  }

  Future<Id> putByRemoteId(EventModel object) {
    return putByIndex(r'remoteId', object);
  }

  Id putByRemoteIdSync(EventModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'remoteId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRemoteId(List<EventModel> objects) {
    return putAllByIndex(r'remoteId', objects);
  }

  List<Id> putAllByRemoteIdSync(List<EventModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'remoteId', objects, saveLinks: saveLinks);
  }
}

extension EventModelQueryWhereSort
    on QueryBuilder<EventModel, EventModel, QWhere> {
  QueryBuilder<EventModel, EventModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EventModelQueryWhere
    on QueryBuilder<EventModel, EventModel, QWhereClause> {
  QueryBuilder<EventModel, EventModel, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterWhereClause> remoteIdEqualTo(
      String remoteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [remoteId],
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterWhereClause> remoteIdNotEqualTo(
      String remoteId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension EventModelQueryFilter
    on QueryBuilder<EventModel, EventModel, QFilterCondition> {
  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detailsEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsEnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detailsEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailsEn',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detailsEn',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsFiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsFiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsFiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsFiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detailsFi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsFiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsFiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsFiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsFiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detailsFi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsFiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailsFi',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsFiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detailsFi',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsSvEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsSvGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsSvLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsSvBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detailsSv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsSvStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsSvEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsSvContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> detailsSvMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detailsSv',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsSvIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailsSv',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      detailsSvIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detailsSv',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> locationEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> locationEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> locationEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationEn',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationEn',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> locationFiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationFiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationFiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> locationFiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationFi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationFiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationFiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationFiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> locationFiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationFi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationFiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationFi',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationFiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationFi',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> locationSvEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationSvGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationSvLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> locationSvBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationSv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationSvStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationSvEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationSvContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> locationSvMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationSv',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationSvIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationSv',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationSvIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationSv',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      locationUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      organizerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'organizerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      organizerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'organizerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      organizerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'organizerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      organizerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'organizerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      organizerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'organizerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      organizerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'organizerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      organizerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'organizerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      organizerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'organizerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      organizerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'organizerName',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      organizerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'organizerName',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      posterPhotoUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posterPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      posterPhotoUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'posterPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      posterPhotoUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'posterPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      posterPhotoUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'posterPhotoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      posterPhotoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'posterPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      posterPhotoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'posterPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      posterPhotoUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'posterPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      posterPhotoUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'posterPhotoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      posterPhotoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posterPhotoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      posterPhotoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'posterPhotoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> priceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> priceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> priceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> priceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> priceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> priceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> priceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> priceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'price',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> priceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      priceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'price',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> remoteIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      remoteIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> remoteIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> remoteIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> remoteIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> remoteIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketDetailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ticketDetailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ticketDetailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ticketDetailsEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ticketDetailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ticketDetailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketDetailsEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketDetailsEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketDetailsEn',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketDetailsEn',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsFiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketDetailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsFiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ticketDetailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsFiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ticketDetailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsFiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ticketDetailsFi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsFiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ticketDetailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsFiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ticketDetailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsFiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketDetailsFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsFiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketDetailsFi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsFiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketDetailsFi',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsFiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketDetailsFi',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsSvEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketDetailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsSvGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ticketDetailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsSvLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ticketDetailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsSvBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ticketDetailsSv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsSvStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ticketDetailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsSvEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ticketDetailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsSvContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketDetailsSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsSvMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketDetailsSv',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsSvIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketDetailsSv',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      ticketDetailsSvIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketDetailsSv',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> timeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> timeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> timeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> timeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> timeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> timeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> timeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> timeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      titleEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleEnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleEn',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      titleEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleEn',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleFiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      titleFiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleFiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleFiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleFi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleFiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleFiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleFiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleFi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleFiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleFi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleFiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleFi',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      titleFiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleFi',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleSvEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      titleSvGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleSvLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleSvBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleSv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleSvStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleSvEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleSvContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleSv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleSvMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleSv',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> titleSvIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleSv',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      titleSvIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleSv',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> topicsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> topicsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'topics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> topicsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'topics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> topicsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'topics',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> topicsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'topics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> topicsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'topics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> topicsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'topics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> topicsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'topics',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> topicsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topics',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      topicsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'topics',
        value: '',
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EventModelQueryObject
    on QueryBuilder<EventModel, EventModel, QFilterCondition> {}

extension EventModelQueryLinks
    on QueryBuilder<EventModel, EventModel, QFilterCondition> {}

extension EventModelQuerySortBy
    on QueryBuilder<EventModel, EventModel, QSortBy> {
  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByDetailsEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsEn', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByDetailsEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsEn', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByDetailsFi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsFi', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByDetailsFiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsFi', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByDetailsSv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsSv', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByDetailsSvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsSv', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByLocationEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationEn', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByLocationEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationEn', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByLocationFi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationFi', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByLocationFiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationFi', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByLocationSv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationSv', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByLocationSvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationSv', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByLocationUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationUrl', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByLocationUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationUrl', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByOrganizerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizerName', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByOrganizerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizerName', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByPosterPhotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterPhotoUrl', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy>
      sortByPosterPhotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterPhotoUrl', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTicketDetailsEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsEn', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy>
      sortByTicketDetailsEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsEn', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTicketDetailsFi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsFi', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy>
      sortByTicketDetailsFiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsFi', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTicketDetailsSv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsSv', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy>
      sortByTicketDetailsSvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsSv', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTitleEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTitleFi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleFi', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTitleFiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleFi', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTitleSv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleSv', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTitleSvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleSv', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTopics() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topics', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByTopicsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topics', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension EventModelQuerySortThenBy
    on QueryBuilder<EventModel, EventModel, QSortThenBy> {
  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByDetailsEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsEn', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByDetailsEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsEn', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByDetailsFi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsFi', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByDetailsFiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsFi', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByDetailsSv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsSv', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByDetailsSvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsSv', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByLocationEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationEn', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByLocationEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationEn', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByLocationFi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationFi', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByLocationFiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationFi', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByLocationSv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationSv', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByLocationSvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationSv', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByLocationUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationUrl', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByLocationUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationUrl', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByOrganizerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizerName', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByOrganizerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizerName', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByPosterPhotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterPhotoUrl', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy>
      thenByPosterPhotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterPhotoUrl', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTicketDetailsEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsEn', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy>
      thenByTicketDetailsEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsEn', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTicketDetailsFi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsFi', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy>
      thenByTicketDetailsFiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsFi', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTicketDetailsSv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsSv', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy>
      thenByTicketDetailsSvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketDetailsSv', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTitleEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTitleFi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleFi', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTitleFiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleFi', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTitleSv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleSv', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTitleSvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleSv', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTopics() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topics', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByTopicsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topics', Sort.desc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<EventModel, EventModel, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension EventModelQueryWhereDistinct
    on QueryBuilder<EventModel, EventModel, QDistinct> {
  QueryBuilder<EventModel, EventModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByDetailsEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailsEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByDetailsFi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailsFi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByDetailsSv(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailsSv', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByLocationEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByLocationFi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationFi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByLocationSv(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationSv', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByLocationUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByOrganizerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'organizerName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByPosterPhotoUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'posterPhotoUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByTicketDetailsEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketDetailsEn',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByTicketDetailsFi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketDetailsFi',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByTicketDetailsSv(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketDetailsSv',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByTitleEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByTitleFi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleFi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByTitleSv(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleSv', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByTopics(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topics', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventModel, EventModel, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension EventModelQueryProperty
    on QueryBuilder<EventModel, EventModel, QQueryProperty> {
  QueryBuilder<EventModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<EventModel, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> detailsEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailsEn');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> detailsFiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailsFi');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> detailsSvProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailsSv');
    });
  }

  QueryBuilder<EventModel, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> locationEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationEn');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> locationFiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationFi');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> locationSvProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationSv');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> locationUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationUrl');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> organizerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'organizerName');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> posterPhotoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'posterPhotoUrl');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> ticketDetailsEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketDetailsEn');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> ticketDetailsFiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketDetailsFi');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> ticketDetailsSvProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketDetailsSv');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> titleEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleEn');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> titleFiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleFi');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> titleSvProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleSv');
    });
  }

  QueryBuilder<EventModel, String, QQueryOperations> topicsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topics');
    });
  }

  QueryBuilder<EventModel, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
