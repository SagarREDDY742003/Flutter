import 'package:spotify/domain/entities/song/song.dart';

abstract class NewSongsState {}

class SongsLoading extends NewSongsState {}

class NewSongsLoading extends NewSongsState {}

class NewSongsLoaded extends NewSongsState {
  final List<SongEntity> songs;
  NewSongsLoaded({required this.songs});
}

class NewSongsLoadFailure extends NewSongsState{
  
}
