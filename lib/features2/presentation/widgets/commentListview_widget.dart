import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features2/domain/entity/comment_entity.dart';

class ReviewWidget extends ConsumerWidget {
  final List<CommentEntity> value;

  const ReviewWidget({super.key, required this.value});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: value.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            value[index].comment,
            style: TextStyle(color: theme.colors.primary),
          ),
          trailing:
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        );
      },
    );
  }
}
