import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:race/domain/data_providers/provider.dart';
import 'package:race/resources/resources.dart';
import 'package:race/ui/common/progress_line/progress_line_widget.dart';
import 'package:race/ui/theme/app_colors.dart';
import 'package:race/ui/theme/app_text_style.dart';
import 'package:race/ui/widgets/profile_detail/profile_avatar/profile_detail__avatar_model.dart';
import 'package:race/ui/widgets/profile_detail/profile_avatar/profile_detail__avatar_widget.dart';
import 'package:race/ui/widgets/profile_detail/profile_detail_model.dart';
import 'package:race/entity/profile_detail/profile_detail.dart';
import 'package:race/ui/widgets/profile_detail/profile_languages/profile_detail_languages.dart';
import 'package:race/ui/widgets/profile_detail/profile_languages/profile_detail_languages_model.dart';

class ProfileDetailWidget extends StatelessWidget {
  const ProfileDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.mainDarkFontColor),
        backgroundColor: AppColors.mainWhiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Profile',
              style: AppTextStyles.mediumHeader,
            )
          ],
        ),
      ),
      // drawer: const Drawer(
      //   backgroundColor: AppColors.mainDarkFontColor,
      // ),
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(),
            child: ListView(
              children: [
                NotifierProvider(
                    model: ProfileDetailWidgetModel(),
                    child: const _ProfileBody()),
              ],
            )),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileDetailWidgetModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: double.infinity),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              NotifierProvider(
                  model: ProfileDetailAvatarWWidgetModel(),
                  child: AvatarWidget(
                      shortName: model?.shortName ?? '',
                      fileLogo: model?.fileLogo ?? '')),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: model?.profileMeDetail != null
                      ? '${model?.profileMeDetail?.firstName} ${model?.profileMeDetail?.firstName}'
                      : '',
                  style: AppTextStyles.largeHeader,
                ),
              ])),
              const SizedBox(
                height: 40,
              ),
              if (model?.profileMeDetail?.languages != null)
                NotifierProvider(
                  model: ProfileDetaiLanguageslWidgetModel(),
                  child: LanguageWidget(
                    languages: model?.profileMeDetail?.languages,
                  ),
                ),
              const SizedBox(
                height: 40,
              ),
              if (model?.profileMeDetail?.contacts != null)
                _ContactsWidget(
                  model: model?.profileMeDetail?.contacts,
                ),
              const SizedBox(
                height: 40,
              ),
              if (model?.profileMeDetail?.expertise != null)
                _SkillsWidget(
                  model: model?.profileMeDetail?.expertise,
                ),
              const SizedBox(
                height: 40,
              ),
              _CommonEoE(
                edu: false,
                experience: model?.profileMeDetail?.workHistory,
              ),
              const SizedBox(
                height: 40,
              ),
              _CommonEoE(
                edu: true,
                education: model?.profileMeDetail?.education,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillsWidget extends StatelessWidget {
  final List<ProfileExpertiseLanguage>? model;

  const _SkillsWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      const Padding(
        padding: EdgeInsets.only(bottom: 40.0),
        child: Center(child: Text('Skills', style: AppTextStyles.largeHeader)),
      ),
      for (ProfileExpertiseLanguage skill in model!) ...[
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Center(
              child: Text(
            '${skill.skill!['name']} / ${skill.proficiencyDisplay}',
            style: AppTextStyles.mediumHeader,
          )),
        ),
        ProgressAnimatedWidget(
          fillPercent: skill.skillPercents!,
        ),
        const SizedBox(
          height: 15,
        )
      ]
    ]);
  }
}

class _LanguageWidget extends StatelessWidget {
  final List<ProfileExpertiseLanguage>? model;
  const _LanguageWidget({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  heroTag: "langButton",
                  onPressed: () {},
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
        for (ProfileExpertiseLanguage lang in model!)
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

class _ContactsWidget extends StatelessWidget {
  final List<ProfileContact>? model;
  const _ContactsWidget({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Contacts',
          style: AppTextStyles.largeHeader,
        ),
        const SizedBox(
          height: 20,
        ),
        for (ProfileContact contact in model ?? [])
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                contact.provider!['name'],
                style: AppTextStyles.mediumHeader,
              ),
              const Text(
                ' : ',
                style: AppTextStyles.smallHeader,
              ),
              Text(
                contact.value ?? '',
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

class _CommonEoE extends StatelessWidget {
  final bool edu;
  final List<ProfileWorkHistory>? experience;
  final List<ProfileEducation>? education;

  const _CommonEoE(
      {Key? key, required this.edu, this.education, this.experience})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = edu ? 'Education' : 'Experience';
    final model = edu ? education : experience;
    List<Widget> widgets = [];
    for (var item in model ?? []) {
      dynamic curItem;
      if (edu) {
        curItem = item as ProfileEducation;
      } else {
        curItem = item as ProfileWorkHistory;
      }
      widgets
          .add(Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          edu
              ? '${(curItem as ProfileEducation).schoolName}'
              : (curItem as ProfileWorkHistory).companyName,
          style: AppTextStyles.mediumHeader,
        ),
        const SizedBox(
          height: 10,
          width: 10,
        ),
        Text(
          edu
              ? '${(curItem as ProfileEducation).fieldOfStudy}  | ${(curItem).city}'
              : (curItem as ProfileWorkHistory).jobTitle,
          style: AppTextStyles.smallGrayHeader,
        ),
        const SizedBox(
          height: 10,
          width: 10,
        ),
        Text(
          edu
              ? '${DateFormat.yMEd().format(DateTime.parse((curItem as ProfileEducation).fromDate))} - ${DateFormat.yMEd().format(DateTime.parse(curItem.toDate))}'
              : '${DateFormat.yMEd().format(DateTime.parse((curItem as ProfileWorkHistory).fromDate))} - ${DateFormat.yMEd().format(DateTime.parse(curItem.toDate))}',
          style: AppTextStyles.smallHeader,
        ),
        const SizedBox(
          height: 10,
          width: 10,
        ),
        Text(
          edu
              ? '${(curItem as ProfileEducation).notes}'
              : '${(curItem as ProfileWorkHistory).jobDescription}',
          style: AppTextStyles.extraSmallHeaderGray,
        )
      ]));
    }
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.largeHeader,
        ),
        const SizedBox(
          height: 20,
        ),
        ...widgets
      ],
    );
  }
}
