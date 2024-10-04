// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDataAdapter extends TypeAdapter<MovieData> {
  @override
  final int typeId = 0;

  @override
  MovieData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieData(
      id: fields[0] as int?,
      popularity: fields[1] as double?,
      voteCount: fields[2] as int?,
      video: fields[3] as bool?,
      posterPath: fields[4] as String?,
      adult: fields[5] as bool?,
      backdropPath: fields[6] as String?,
      originalLanguage: fields[7] as String?,
      originalTitle: fields[8] as String?,
      genreIds: (fields[9] as List?)?.cast<int>(),
      title: fields[10] as String?,
      voteAverage: fields[11] as double?,
      overview: fields[12] as String?,
      releaseDate: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieData obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.popularity)
      ..writeByte(2)
      ..write(obj.voteCount)
      ..writeByte(3)
      ..write(obj.video)
      ..writeByte(4)
      ..write(obj.posterPath)
      ..writeByte(5)
      ..write(obj.adult)
      ..writeByte(6)
      ..write(obj.backdropPath)
      ..writeByte(7)
      ..write(obj.originalLanguage)
      ..writeByte(8)
      ..write(obj.originalTitle)
      ..writeByte(9)
      ..write(obj.genreIds)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.voteAverage)
      ..writeByte(12)
      ..write(obj.overview)
      ..writeByte(13)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
