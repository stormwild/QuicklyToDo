import 'bloc/settings_bloc.dart';
import 'models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:quickly_to_do_app/core/app_export.dart';
import 'package:quickly_to_do_app/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:quickly_to_do_app/widgets/app_bar/custom_app_bar.dart';
import 'package:quickly_to_do_app/widgets/custom_outlined_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
        create: (context) =>
            SettingsBloc(SettingsState(settingsModelObj: SettingsModel()))
              ..add(SettingsInitialEvent()),
        child: SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 32.h, top: 74.v, right: 32.h),
                  child: Column(children: [
                    _buildSettingOption(context),
                    SizedBox(height: 34.v),
                    _buildLanguage(context, languageText: "lbl_personality".tr),
                    SizedBox(height: 14.v),
                    _buildLanguage(context, languageText: "lbl_language".tr),
                    SizedBox(height: 14.v),
                    _buildLanguage(context,
                        languageText: "msg_terms_and_conditions".tr),
                    Spacer(),
                    SizedBox(height: 31.v),
                    CustomOutlinedButton(text: "lbl_log_out".tr)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.fromLTRB(32.h, 16.v, 319.h, 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }));
  }

  /// Section Widget
  Widget _buildSettingOption(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_settings".tr, style: theme.textTheme.headlineMedium),
      SizedBox(height: 9.v),
      Text("msg_your_settings_so".tr, style: theme.textTheme.labelLarge)
    ]);
  }

  /// Common widget
  Widget _buildLanguage(
    BuildContext context, {
    required String languageText,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 19.v),
        decoration: AppDecoration.outlineBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder14),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
              padding: EdgeInsets.only(top: 2.v),
              child: Text(languageText,
                  style: CustomTextStyles.labelLargeOnPrimary.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.6)))),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 6.v,
              width: 3.h,
              margin: EdgeInsets.only(left: 93.h, top: 7.v, bottom: 7.v))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
