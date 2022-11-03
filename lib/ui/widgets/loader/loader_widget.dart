import 'package:flutter/material.dart';
import 'package:race/domain/data_providers/provider.dart';
import 'package:race/ui/common/loading/loading_widget.dart';
import 'package:race/ui/theme/app_text_style.dart';
import 'package:race/resources/resources.dart';
import 'package:race/ui/widgets/loader/loader_widget_model.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                height: 250,
                alignment: Alignment.topCenter,
                child: const Image(
                  image: AssetImage(AppImages.bgLoader),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage(AppImages.raceLogoLoader),
                ),
              ),
              Container(
                  height: 330,
                  alignment: Alignment.bottomCenter,
                  child: const CommonLoadingWidget()),
            ]),
            const SizedBox(height: 25),
            const Text(
              'Race is firing up its engines',
              textAlign: TextAlign.center,
              style: AppTextStyles.largeHeader,
            ),
            const SizedBox(height: 5),
            const Text(
              'Get ready to accelerate your projects and start collaborating',
              textAlign: TextAlign.center,
              style: AppTextStyles.extraSmallHeaderGray,
            ),
            NotifierProvider(
                model: LoaderWidgetModel(), child: const _LoaderWidget()),
          ],
        ),
      ),
    );
  }
}

class _LoaderWidget extends StatelessWidget {
  const _LoaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<LoaderWidgetModel>(context);
    model?.getUserMe(context);
    return Container();
  }
}
