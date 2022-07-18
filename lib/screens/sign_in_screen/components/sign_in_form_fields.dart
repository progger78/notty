import 'package:flutter/material.dart';

import 'package:my_todo/exceptions/http_exceptions.dart';

import 'package:my_todo/utils/utils.dart';
import 'package:my_todo/widgets/default_button.dart';
import 'package:my_todo/widgets/suffix_icon.dart';
import 'package:provider/provider.dart';

import '../../../models/auth.dart';
import '../../../widgets/widgets.dart';

class SignInFormFields extends StatefulWidget {
  const SignInFormFields({Key? key}) : super(key: key);

  @override
  State<SignInFormFields> createState() => _SignInFormFieldsState();
}

class _SignInFormFieldsState extends State<SignInFormFields> {
  List<String> errors = [];
  var isLoading = false;
  final Map<String, String> _authData = {'email': '', 'password': ''};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => CustomAlertDialog(
              context: context,
              content: message,
              twoButtons: false,
            ));
  }

  Future<void> _submit() async {
    var isValid = _formKey.currentState!.validate();
    if (isValid && errors.isEmpty) {
      _formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      try {
        await Provider.of<Auth>(context, listen: false).signIn(
          _authData['email']!,
          _authData['password']!,
        );
      } on HttpException catch (e) {
        var message = 'Authentication failed';
        switch (e.toString()) {
          case 'INVALID_EMAIL':
            message = 'You entered invalid email';
            break;
          case 'EMAIL_EXISTS':
            message = 'Email is already exists';
            break;
          case 'WEAK_PASSWORD':
            message = 'Password is too weak';
            break;
          case 'EMAIL_NOT_FOUND':
            message = 'Email not found';
            break;
          case 'INVALID_PASSWORD':
            message = 'Invalid password';
            break;
          default:
            message;
            return;
        }
        showErrorDialog(message);
      } catch (e) {
        var message = 'Could not authenticate you';
        showErrorDialog(message);
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              buildEmailField(),
              SizedBox(height: getProportionateScreenHeight(10)),
              buildPasswordField(),
              SizedBox(height: getProportionateScreenHeight(10)),
              CustomErrors(errors: errors),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              !isLoading
                  ? DefaultButton(text: 'Continue', press: _submit)
                  : const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return Container(
      width: double.maxFinite,
      height: getProportionateScreenHeight(65),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(20)),
          color: AppColors.kSecondaryColor),
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            color: AppColors.kOrangeColor,
            fontSize: getProportionateScreenHeight(20)),
        decoration: InputDecoration(
            suffixIcon: const CustomSuffixIcon(
              svgIcon: 'assets/icons/Mail.svg',
            ),
            labelStyle: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenHeight(22)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(5)),
            labelText: 'Email',
            floatingLabelBehavior: FloatingLabelBehavior.always),
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kEmailNullError)) {
            setState(() {
              errors.add(kEmailNullError);
            });
          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.add(kInvalidEmailError);
            });
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            setState(() {
              errors.remove(kEmailNullError);
            });
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.remove(kInvalidEmailError);
            });
          }
        },
        onSaved: (value) => _authData['email'] = value!,
      ),
    );
  }

  Widget buildPasswordField({String? hint, String? labelText}) {
    return Container(
      width: double.maxFinite,
      height: getProportionateScreenHeight(65),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(20)),
          color: AppColors.kSecondaryColor),
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            color: AppColors.kOrangeColor,
            fontSize: getProportionateScreenHeight(20)),
        obscureText: true,
        decoration: InputDecoration(
            suffixIcon: const CustomSuffixIcon(
              svgIcon: 'assets/icons/Lock.svg',
            ),
            labelStyle: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenHeight(22)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(5)),
            alignLabelWithHint: true,
            labelText: 'Password',
            floatingLabelBehavior: FloatingLabelBehavior.always),
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kPassNullError)) {
            setState(() {
              errors.add(kPassNullError);
            });
          } else if (value.length < 8 && !errors.contains(kShortPassError)) {
            setState(() {
              errors.add(kShortPassError);
            });
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPassNullError)) {
            setState(() {
              errors.remove(kPassNullError);
            });
          } else if (value.length > 8 && errors.contains(kShortPassError)) {
            setState(() {
              errors.remove(kShortPassError);
            });
          }
        },
        onSaved: (value) => _authData['password'] = value!,
      ),
    );
  }
}
