import 'package:get/get.dart';
import 'package:my_todo/screens/add_note_screen/add_note_screen.dart';
import 'package:my_todo/screens/main_screen/main_screen.dart';

class RouteHelper {
  static const String initialScreen = '/';

  static const String forgotPasswordScreen = '/forgot-password-screen';
  static const String signInScreen = '/sign-in-screen';
  static const String signUpScreen = '/sign-up-screen';
  static const String otpScreen = '/otp-screen';
  static const String completeProfileScreen = '/complete-profile-screen';
  static const String loginSuccessfulScreen = '/login-successful-screen';

  static const String homeScreen = '/home-screen';
  static const String detailProductScreen = '/detail-product-screen';
  
  static const String addNoteScreen = '/add-note-screen';

  static const String ordersScreen = '/order-screen';
  static const String userProductScreen = '/user-product-screen';
  static const String editProductScreen = '/edit-product-screen';

  static getInitial() => initialScreen;
  static getDetailProductScreen(int pageId) =>
      '$detailProductScreen?pageId=$pageId';
  static getAddNoteScreen() => addNoteScreen;
  static getOrdersScreen() => ordersScreen;
  static getCompleteProfileScreen() => completeProfileScreen;
  static getSignInScreen() => signInScreen;
  static getOtpScreen() => otpScreen;
  static getEditProductScreen(int? pageId) =>
      '$editProductScreen?pageId=$pageId';

  static List<GetPage> pages = [
    GetPage(
        name: initialScreen,
        transition: Transition.fadeIn,
        page: () {
          return const MainScreen();
        }),
    GetPage(
        name: addNoteScreen,
        transition: Transition.fadeIn,
        page: () {
          return const AddNoteScreen();
        }),
    // GetPage(
    //     name: forgotPasswordScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const ForgotPasswordScreen();
    //     }),
    // GetPage(
    //     name: loginSuccessfulScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const LoginSuccessful();
    //     }),
    // GetPage(
    //     name: signUpScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const SignUpScreen();
    //     }),
    // GetPage(
    //     name: completeProfileScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const CompletProfileScreen();
    //     }),
    // GetPage(
    //     name: otpScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const OtpScreen();
    //     }),
    // GetPage(
    //     name: homeScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const HomeScreen();
    //     }),
    // GetPage(
    //     name: mainProdScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const MainProducrScreen();
    //     }),
    // GetPage(
    //     name: detailProductScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       var pageId = Get.parameters['pageId'];
    //       return DetailProductScreen(
    //         pageId: int.parse(pageId!),
    //       );
    //     }),
    // GetPage(
    //     name: cartScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const CartScreen();
    //     })
  ];
}
