import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features2/domain/entity/comment_entity.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';
import 'package:movieapp/features2/presentation/widgets/commentListview_widget.dart';

class Addcomment extends HookConsumerWidget {
  final MovieEntity entity;
  const Addcomment({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentcontroller = useTextEditingController();
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(20, 60),
            backgroundColor: AppTheme.of(context).colors.backgroundDanger),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    padding:
                        EdgeInsets.all(AppTheme.of(context).spaces.space_100),
                    height: AppTheme.of(context).spaces.space_800 * 10,
                    decoration: BoxDecoration(
                        color: AppTheme.of(context).colors.backgroundDanger,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                                AppTheme.of(context).spaces.space_300))),
                    child: Column(
                      children: [
                        TextField(
                          controller: commentcontroller,
                          decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 221, 230, 235),
                              hintText: "Leave your comment",
                              filled: true,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    ref.read(movieProvider.notifier).addComment(
                                          CommentEntity(
                                              comment: commentcontroller.text,
                                              id: entity.id.toString()),
                                          entity.title,
                                        );
                                  },
                                  icon: Icon(Icons.send)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: 300,
                            child: StreamBuilder(
                              stream: ref
                                  .read(movieProvider.notifier)
                                  .getcomment(entity.title),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ReviewWidget(
                                    value: snapshot.data!,
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(snapshot.error.toString());
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
        },
        child: Text("Add comments"));
  }
}
