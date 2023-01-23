import 'package:flutter/material.dart';
import 'package:race/domain/data_providers/provider.dart';
import 'package:race/domain/data_providers/session_data_provider.dart';
import 'package:race/resources/resources.dart';
import 'package:race/ui/common/profile/profile_model.dart';
import 'package:race/ui/common/profile/profile_widget.dart';
import 'package:race/ui/navigator/main_navigator.dart';
import 'package:race/ui/theme/app_colors.dart';
import 'package:race/ui/theme/app_text_style.dart';
import 'package:race/ui/widgets/dashboard/tasks_card/tasks_card_model.dart';
import 'package:race/ui/widgets/dashboard/tasks_card/tasks_card_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.mainDarkFontColor),
        backgroundColor: AppColors.mainWhiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(
              image: AssetImage(AppImages.raceLogo),
              height: 20,
              fit: BoxFit.contain,
            ),
            Row(
              children: [
                NotifierProvider(
                    model: ProfileWidgetModel(), child: const ProfileWidget()),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.55,
        backgroundColor: AppColors.mainDarkFontColor,
        child: ListView(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(),
                child: SizedBox(
                  height: 40,
                  child: InkWell(
                    onTap: () {
                      final sessionDataProvider = SessionDataProvider();
                      sessionDataProvider.removeToken();
                      Navigator.of(context)
                          .pushReplacementNamed(MainNavigatorRouteNames.login);
                    },
                    child: const Center(
                        child: Text(
                      'LogOut',
                      style: AppTextStyles.mediumWhiteHeader,
                    )),
                  ),
                )),
          ],
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: const [
          // NotifierProvider(
          //     model: TaskCardWidgetModel(), child: const TasksCard()),
          TasksCard()
        ],
      )),
    );
  }
}
