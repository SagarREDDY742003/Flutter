import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:spotify/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotify/domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final Function ? function;
  const FavoriteButton({super.key, required this.songEntity, this.function});
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
              onPressed: () async {
                await context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                  songEntity.songId,
                );
                if (function != null) {
                  function!();
                }
              },
              icon: Icon(
                songEntity.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                size: 25,
                color: const Color.fromARGB(255, 255, 0, 0),
              ),
            );
          }

          if (state is FavoriteButtonUpdated) {
            return IconButton(
              onPressed: () async{
                await context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                  songEntity.songId,
                );
              },
              icon: Icon(
                state.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                size: 25,
                color: const Color.fromARGB(255, 255, 0, 0),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
