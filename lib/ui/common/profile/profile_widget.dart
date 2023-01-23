import 'package:flutter/material.dart';
import 'package:race/domain/data_providers/provider.dart';
import 'package:race/ui/common/profile/profile_model.dart';
import 'package:race/ui/navigator/main_navigator.dart';
import 'package:race/ui/theme/app_colors.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileWidgetModel>(context);
    final String? fileLogo =
        model!.isImg ? model.profile!.profile!.photo!.file : null;
    final Widget shortNamewidget = InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(MainNavigatorRouteNames.profileDetail);
      },
      child: Text(
        model.shortName,
        style: const TextStyle(color: AppColors.mainDarkFontColor),
      ),
    );
    final Widget logoWidget = ClipOval(
      child: Material(
        color: Colors.transparent,
        child: fileLogo != null
            ? Ink.image(
                image: NetworkImage(fileLogo),
                fit: BoxFit.cover,
                width: 35,
                height: 35,
                child: InkWell(onTap: () {
                  Navigator.of(context)
                      .pushNamed(MainNavigatorRouteNames.profileDetail);
                }),
              )
            : shortNamewidget,
      ),
    );

    return Center(
      child: logoWidget,
    );
  }
}
