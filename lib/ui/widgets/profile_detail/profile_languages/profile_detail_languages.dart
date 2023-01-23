import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:race/domain/data_providers/provider.dart';
import 'package:race/entity/profile_detail/profile_detail.dart';
import 'package:race/resources/resources.dart';
import 'package:race/ui/theme/app_colors.dart';
import 'package:race/ui/theme/app_text_style.dart';
import 'package:race/ui/widgets/profile_detail/profile_languages/profile_detail_languages_model.dart';

class LanguageWidget extends StatelessWidget {
  final List<ProfileExpertiseLanguage>? languages;
  const LanguageWidget({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileDetaiLanguageslWidgetModel>(context);
    return Column(
      children: [
        Text.rich(TextSpan(children: [
          const TextSpan(
            text: 'Languages',
            style: AppTextStyles.largeHeader,
          ),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: FloatingActionButton(
                  heroTag: "editLang",
                  onPressed: () => model!.editChange(),
                  backgroundColor: AppColors.mainBlueColor,
                  child: SvgPicture.asset(
                    AppImages.plus,
                    color: AppColors.mainWhiteColor,
                    fit: BoxFit.contain,
                    width: 11,
                  ),
                ),
              ),
            ),
          ),
        ])),
        const SizedBox(
          height: 20,
        ),
        for (ProfileExpertiseLanguage lang in languages!)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                lang.language != null ? '${lang.language}' : '',
                style: AppTextStyles.mediumHeader,
              ),
              const Text(
                ' / ',
                style: AppTextStyles.smallHeader,
              ),
              Text(
                lang.proficiencyDisplay,
                style: AppTextStyles.smallHeader,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )
      ],
    );
  }
}
