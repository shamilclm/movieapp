import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';
import 'package:movieapp/features2/presentation/widgets/gridviewbuilder_widgets.dart';

class Search extends HookConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchcontroller = useTextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: TextField(
                  controller: searchcontroller,
                  decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 221, 230, 235),
                      hintText: "Search your Movies",
                      filled: true,
                      suffixIcon: IconButton(
                          onPressed: () {
                            ref
                                .read(movieProvider.notifier)
                                .serchMovies(searchcontroller.text, context);
                            searchcontroller.clear();
                          },
                          icon: const Icon(Icons.search)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              Text(
                'Results :',
                style: AppTheme.of(context)
                    .typography
                    .h600
                    .copyWith(color: Colors.black),
              ),
              Builder(
                builder: (context) {
                  return ref.watch(movieProvider).when(
                      data: (data) {
                        if (data.searchmovies == null) {
                          return TextButton(
                              onPressed: () {
                                ref.read(movieProvider.notifier).serchMovies(
                                    searchcontroller.text, context);
                              },
                              child: const Text(
                                "No data available",
                                style: TextStyle(color: Colors.white),
                              ));
                        } else {
                          return SizedBox(
                              height: 600,
                              child: GridviewList(
                                  itemCount: data.searchmovies!.length,
                                  list: data.searchmovies!));
                        }
                      },
                      error: (error, stackTrace) => Center(
                            child: Text(error.toString()),
                          ),
                      loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
