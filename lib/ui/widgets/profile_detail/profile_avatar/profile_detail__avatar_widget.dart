import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:race/domain/data_providers/provider.dart';
import 'package:race/entity/common/race_file.dart';
import 'package:race/resources/resources.dart';
import 'package:race/ui/theme/app_colors.dart';
import 'package:race/ui/widgets/profile_detail/profile_avatar/profile_detail__avatar_model.dart';
import 'package:race/ui/widgets/profile_detail/profile_detail__image_dialog_widget.dart';

class AvatarWidget extends StatelessWidget {
  final String shortName;
  final String fileLogo;
  const AvatarWidget(
      {Key? key, required this.shortName, required this.fileLogo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model =
        NotifierProvider.watch<ProfileDetailAvatarWWidgetModel>(context);
    final bool isImg =
        model != null && model.fileLogo.isNotEmpty ? true : false;
    final bool isImgFromState = fileLogo.isNotEmpty ? true : false;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 128,
        height: 128,
        decoration: BoxDecoration(
          color: AppColors.mainGreyColor,
          border: Border.all(color: Colors.black, width: 0.0),
          borderRadius: const BorderRadius.all(Radius.circular(64)),
        ),
        child: Stack(fit: StackFit.expand, children: [
          isImg || isImgFromState
              ? ClipOval(
                  child: Image.network(
                    model != null && model.fileLogo.isNotEmpty
                        ? model.fileLogo
                        : fileLogo,
                    fit: BoxFit.cover,
                    width: 35,
                    height: 35,
                  ),
                )
              : Center(
                  child: Text(
                    shortName,
                    style: const TextStyle(color: AppColors.mainDarkFontColor),
                  ),
                ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: 35,
              width: 35,
              child: FloatingActionButton(
                heroTag: "modalInit",
                onPressed: () async {
                  final RaceFile? file = await showDialog(
                      context: context,
                      builder: (context) => const ImageDialog());
                  if (file != null) {
                    model?.updateProfilePhoto(file);
                  }
                },
                backgroundColor: AppColors.mainBlueColor,
                child: SvgPicture.asset(
                  AppImages.pencilEdit,
                  color: AppColors.mainWhiteColor,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
