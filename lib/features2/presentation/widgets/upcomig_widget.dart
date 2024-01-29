import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapp/core/constants/movie_constants.dart';
import 'package:movieapp/core/theme/app_theme.dart';

class Upcomigsub extends StatelessWidget {
  const Upcomigsub({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppTheme.of(context).spaces.space_500,
      width: AppTheme.of(context).spaces.space_900 * 6,
      child: Padding(
        padding: EdgeInsets.only(left: AppTheme.of(context).spaces.space_125),
        child: Text(Movies.title3,
            style: AppTheme.of(context)
                .typography
                .h700
                .copyWith(color: AppTheme.of(context).colors.textInverse)),
      ),
    );
  }
}
