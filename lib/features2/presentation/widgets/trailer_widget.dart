import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/presentation/providers/trailer_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends ConsumerWidget {
  final MovieEntity entity;
  const VideoWidget({super.key, required this.entity});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 250,
      child: Center(
        child: switch (ref.watch(trailerProvider(entity.id.toString()))) {
          AsyncData(:final value) => ListView.builder(
              shrinkWrap: true,
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: value.length,
              itemBuilder: (context, index) {
                return YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: value[index].key,
                    flags: const YoutubePlayerFlags(
                      autoPlay: false,
                      disableDragSeek: true,
                    ),
                  ),
                  bufferIndicator:
                      const Center(child: CircularProgressIndicator()),
                  showVideoProgressIndicator: true,
                );
              },
            ),
          AsyncError(
            :final error,
          ) =>
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error.toString()),
                IconButton(
                    onPressed: () {
                      ref.invalidate(trailerProvider);
                    },
                    icon: const Icon(
                      Icons.refresh,
                      size: 40,
                    ))
              ],
            ),
          _ => const CircularProgressIndicator()
        },
      ),
    );
  }
}
