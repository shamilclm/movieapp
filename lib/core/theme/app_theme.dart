import 'package:flutter/material.dart';
import 'package:movieapp/core/theme/extention/color_extention.dart';
import 'package:movieapp/core/theme/extention/space_extention.dart';
import 'package:movieapp/core/theme/extention/trypography_extention.dart';

final class AppTheme {
  final BuildContext context;

  AppTheme.of(this.context);

  AppColorExtension get colors {
    return Theme.of(context).extension<AppColorExtension>()!;
  }

  AppSpaceExtension get spaces {
    return Theme.of(context).extension<AppSpaceExtension>()!;
  }

  AppTypographyExtension get typography {
    return Theme.of(context).extension<AppTypographyExtension>()!;
  }
}