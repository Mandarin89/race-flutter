import 'package:flutter/material.dart';
import 'package:race/domain/data_providers/provider.dart';
import 'package:race/entity/dropdownList.dart';
import 'package:race/entity/user_account/accounts.dart';
import 'package:race/resources/resources.dart';
import 'package:race/ui/common/dropdown/dropdown_widget.dart';
import 'package:race/ui/theme/app_colors.dart';
import 'package:race/ui/theme/app_text_style.dart';
import 'package:race/ui/widgets/login/login_widget_model.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(AppImages.background),
        )),
        child: ListView(
          children: const [_LoginPageWidget()],
        ),
      ),
    );
  }
}

class _LoginPageWidget extends StatelessWidget {
  const _LoginPageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _HeaderWidget(),
        NotifierProvider(model: LoginWidgetModel(), child: const _BodyWidget()),
      ],
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);
  static final List<DropDownList> list = [
    DropDownList(key: 'en', name: 'English'),
    // DropDownList(key: 'ch', name: 'Chineese')
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Select language',
          textAlign: TextAlign.center,
          style: AppTextStyles.mediumHeader,
        ),
        RaceDropdownWidget(list: list),
        const SizedBox(
          height: 30,
          width: 1,
        ),
        const Image(
          image: AssetImage(AppImages.logo),
          width: 250,
          height: 50,
        ),
        const SizedBox(
          height: 30,
          width: 1,
        ),
      ],
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<LoginWidgetModel>(context);
    Widget bodyWidget = const _FormWidget();

    if (model?.showAccountsFrame == true) {
      bodyWidget = const _ChooseAccountWidget();
    } else if (model?.showMfaFrame == true) {
      bodyWidget = const _MfaWidget();
    }
    return bodyWidget;
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<LoginWidgetModel>(context);
    return Column(
      children: [
        const Image(
          image: AssetImage(AppImages.signIn),
          width: 250,
          height: 90,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Text(model!.errorMessage, style: AppTextStyles.errorMessage),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: TextFormField(
            maxLines: 1,
            style: AppTextStyles.extraSmallHeader,
            controller: model.loginTextController,
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              suffixIcon: const Icon(Icons.mail),
            ),
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
          ),
        ),
        const SizedBox(
          width: 1,
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: TextFormField(
            maxLines: 1,
            style: AppTextStyles.extraSmallHeader,
            controller: model.passwordTextController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              suffixIcon: const Icon(Icons.security),
            ),
            autofillHints: const [AutofillHints.password],
          ),
        ),
        const _LoginButtonsWidget()
      ],
    );
  }
}

class _LoginButtonsWidget extends StatelessWidget {
  const _LoginButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<LoginWidgetModel>(context);
    final signInButtonContent = model?.loading
        ? const SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              color: AppColors.mainWhiteColor,
              strokeWidth: 2.5,
            ))
        : const Text(
            'Sign in',
            style: AppTextStyles.extraSmallHeaderwhite,
          );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () => model?.auth(context),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 25)),
              backgroundColor:
                  MaterialStateProperty.all(AppColors.mainBlueColor),
            ),
            child: signInButtonContent,
          ),
        ],
      ),
    );
  }
}

class _ChooseAccountWidget extends StatelessWidget {
  const _ChooseAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<LoginWidgetModel>(context);
    final List<Account>? accounts = model?.accounts;
    final continueButtonContent = model?.loading
        ? const SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              color: AppColors.mainWhiteColor,
              strokeWidth: 2.5,
            ))
        : const Text(
            'Continue',
            style: AppTextStyles.extraSmallHeaderwhite,
          );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 52,
            width: 1,
          ),
          const Text(
            'Select Account',
            style: AppTextStyles.mediumGrayHeader,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
            width: 1,
          ),
          _BackButton(model: model),
          if (accounts != null)
            for (var account in accounts) // loop accounts widgets
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 18),
                child: TextButton(
                  onPressed: () {
                    model?.selectAccount(account);
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(10, 10, 5, 10)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.mainWhiteColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        side: BorderSide(
                            color: model?.selectedAccount?.id != account.id
                                ? AppColors.mainGreyColor
                                : AppColors.mainBlueColor),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Image(
                        image: AssetImage(AppImages.raceLogo),
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        height: 1,
                        width: 20,
                      ),
                      Text(
                        account.name,
                        style: AppTextStyles.smallHeader,
                      ),
                    ],
                  ),
                ),
              ), // end loop accounts widgets
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: TextButton(
              onPressed: () {
                model?.selectedAccount != null ? model?.auth(context) : null;
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 25)),
                backgroundColor:
                    MaterialStateProperty.all(AppColors.mainBlueColor),
              ),
              child: continueButtonContent,
            ),
          ),
        ],
      ),
    );
  }
}

class _MfaWidget extends StatelessWidget {
  const _MfaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<LoginWidgetModel>(context);
    final signInButtonContent = model?.loading
        ? const SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              color: AppColors.mainWhiteColor,
              strokeWidth: 2.5,
            ))
        : const Text(
            'Sing In',
            style: AppTextStyles.extraSmallHeaderwhite,
          );
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(children: <Widget>[
        const SizedBox(
          height: 60,
          width: 1,
        ),
        const Text(
          'Enter Authentication Code',
          style: AppTextStyles.mediumGrayHeader,
        ),
        const SizedBox(
          height: 20,
          width: 1,
        ),
        _BackButton(model: model),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: TextFormField(
            maxLines: 1,
            style: AppTextStyles.extraSmallHeader,
            controller: model?.mfaTextController,
            decoration: InputDecoration(
              hintText: 'Enter code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              suffixIcon: const Icon(Icons.password),
            ),
            keyboardType: TextInputType.visiblePassword,
            autofillHints: const [AutofillHints.password],
          ),
        ),
        const SizedBox(
          height: 18,
          width: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                onPressed: () => model?.auth(context),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 25)),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.mainBlueColor),
                ),
                child: signInButtonContent,
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    Key? key,
    required this.model,
  }) : super(key: key);

  final LoginWidgetModel? model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => model?.changeAuthFrame(),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 0, horizontal: 25)),
            backgroundColor:
                MaterialStateProperty.all(AppColors.mainWhiteColor),
          ),
          child: const Text(
            'Go Back',
            style: AppTextStyles.extraSmallHeaderGray,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
