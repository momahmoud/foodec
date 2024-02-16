import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_button_widget.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_form_field.dart';
import '../../../../core/helper_widgets/toast_messages.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/validators.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_state.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManger.primaryColor500,
                  ),
                );
              },
            );
          },
          success: (loginResponse) {
            context.pop();
            ToastMessages.showToastMessage(
              msg: StringsConstants.loginSuccess.tr(context)!,
              state: ToastStates.SUCCESS,
            );
            // context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            ToastMessages.showToastMessage(
              msg: error.toString(),
              state: ToastStates.ERROR,
            );
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: cubit.emailController,
                onChanged: (value) {
                  cubit.validEmail(state.maybeWhen(
                    orElse: () => false,
                    validEmail: (isValid) {
                      return AppRegex.isEmailValid(value);
                    },
                  ));
                },
                fillColor: ColorsManger.neutralColor20,
                suffixIcon: CustomSvgImage(
                  imageName: ImagesConstants.checkCircle,
                  color: state.maybeWhen(
                    orElse: () => false,
                    validEmail: (value) => value,
                  )
                      ? ColorsManger.greenColor500
                      : ColorsManger.neutralColor50,
                ),
                hint: StringsConstants.usernameOrEmail.tr(context),
                validator: (String? value) {
                  return Validators.validateEmail(value, context);
                },
                textInputType: TextInputType.emailAddress,
              ),
              verticalSpacing(8.h),
              CustomTextFormField(
                controller: cubit.passwordController,
                fillColor: ColorsManger.neutralColor20,
                isObscure: cubit.handleShowPassword(state),
                validator: (String? value) {
                  return Validators.validatePassword(value, context);
                },
                textInputType: TextInputType.visiblePassword,
                hint: StringsConstants.password.tr(context),
                suffixIcon: InkWell(
                  onTap: () {
                    cubit.toggleShowPassword(cubit.handleShowPassword(state));
                  },
                  child: Icon(
                    cubit.handleShowPassword(state)
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20.sp,
                    color: ColorsManger.neutralColor50,
                  ),
                ),
              ),
              verticalSpacing(16.h),
              CustomButtonWidget(
                text: StringsConstants.login.tr(context),
                color: ColorsManger.redColor400,
                height: 44.h,
                radius: 15.r,
                onTap: () => cubit.login(),
              ),
            ],
          ),
        );
      },
    );
  }
}
