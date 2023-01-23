import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:race/entity/common/race_file.dart';
import 'package:race/resources/resources.dart';
import 'package:race/ui/theme/app_colors.dart';
import 'package:race/ui/theme/app_text_style.dart';
import 'package:race/ui/widgets/profile_detail/profile_avatar/profile_detail__avatar_model.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ProfileDetailAvatarWWidgetModel();
    final navigator = Navigator.of(context);
    RaceFile? file;
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () async {
              file = await model.getPictureFromCamera();
              navigator.pop(file);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(AppImages.photoCamera,
                        color: AppColors.mainGreyColor, fit: BoxFit.contain)),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Camera',
                  style: AppTextStyles.smallHeader,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () async {
              file = await model.getPictureFromGallery();
              navigator.pop(file);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(
                    AppImages.galleryPhoto,
                    color: AppColors.mainGreyColor,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  'Gallery',
                  style: AppTextStyles.smallHeader,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
