import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/songs/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/domain/usecases/auth/get_user.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/add_remove_favorite_songs.dart';
import 'package:spotify/domain/usecases/song/get_new_songs.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';
import 'package:spotify/domain/usecases/song/get_user_favorite_songs.dart';
import 'package:spotify/domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
 
 sl.registerSingleton<AuthFirebaseService>(
  AuthFirebaseServiceImp()
 );

 sl.registerSingleton<AuthRepository>(
  AuthRepositoryImpl()
 );

  sl.registerSingleton<SignupUseCase>(
  SignupUseCase()
 );

  sl.registerSingleton<SigninUseCase>(
  SigninUseCase()
 );

  sl.registerSingleton<SongFirebaseService>(
  SongFirebaseServiceImpl()
 );

  sl.registerSingleton<SongsRepository>(
  SongRepositoryImpl()
 );

  sl.registerSingleton<GetNewSongsUseCase>(
  GetNewSongsUseCase()
 );

  sl.registerSingleton<GetPlayListUseCase>(
  GetPlayListUseCase()
 );

 sl.registerSingleton<AddRemoveFavoriteSongsUseCase>(
  AddRemoveFavoriteSongsUseCase()
 );

 sl.registerSingleton<IsFavoriteSong>(
  IsFavoriteSong()
 );

 sl.registerSingleton<GetUserUseCase>(
  GetUserUseCase()
 );

sl.registerSingleton<GetUserFavoriteSongsUsecase>(
  GetUserFavoriteSongsUsecase()
 );

}