import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/movie_constants.dart';
import 'package:movieapp/core/theme/app_theme.dart';

class Elevatedbutton extends StatelessWidget {
  const Elevatedbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(20, 60),
            backgroundColor: AppTheme.of(context).colors.backgroundDanger),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.play_arrow,
              color: AppTheme.of(context).colors.textInverse,
            ),
            Text(
              Movies.trailer,
              style: AppTheme.of(context)
                  .typography
                  .h500
                  .copyWith(color: AppTheme.of(context).colors.textInverse),
            ),
          ],
        ));
  }
}
