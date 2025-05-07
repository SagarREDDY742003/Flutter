import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      var data =
          await FirebaseFirestore.instance
              .collection('Songs')
              .orderBy('releaseDate', descending: true)
              .limit(4)
              .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return Left('An error occured, Please try again');
    }
  }
  
  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data =
          await FirebaseFirestore.instance
              .collection('Songs')
              .orderBy('releaseDate', descending: true)
              .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return Left('An error occured, Please try again');
    }
  }
}
