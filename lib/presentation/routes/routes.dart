import 'package:aktaris_app/presentation/ui/auth/login/login_route.dart';
import 'package:aktaris_app/presentation/ui/auth/otp/otp_route.dart';
import 'package:aktaris_app/presentation/ui/auth/register/register_route.dart';
import 'package:aktaris_app/presentation/ui/auth/reset_password/reset_password_route.dart';
import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_route.dart';
import 'package:aktaris_app/presentation/ui/firsttest/cara_bayarQr_routes.dart';
import 'package:aktaris_app/presentation/ui/firsttest/cara_bayar_routes.dart';
import 'package:aktaris_app/presentation/ui/firsttest/listtransaksi_route.dart';
import 'package:aktaris_app/presentation/ui/firsttest/privacy_routes.dart';
import 'package:aktaris_app/presentation/ui/firsttest/rincian_bayar_routes.dart';
import 'package:aktaris_app/presentation/ui/firsttest/syarat_ketentuan_routes.dart';
import 'package:aktaris_app/presentation/ui/firsttest/tunggu_notaris_routes.dart';
import 'package:aktaris_app/presentation/ui/home/home_routes.dart';
import 'package:aktaris_app/presentation/ui/message/chat/chat_screen_route.dart';
import 'package:aktaris_app/presentation/ui/message/preview_file_message/preview_file_message_route.dart';
import 'package:aktaris_app/presentation/ui/notaris/notaris_route.dart';
import 'package:aktaris_app/presentation/ui/profile/personal_data/change_personal_data/change_personaldata_route.dart';
import 'package:aktaris_app/presentation/ui/profile/personal_data/personal_data_route.dart';
import 'package:aktaris_app/presentation/ui/profile/personal_document/personal_document_route.dart';
import 'package:aktaris_app/presentation/ui/profile/profile_route.dart';
import 'package:aktaris_app/presentation/ui/profile/setting/change_password/change_password_route.dart';
import 'package:aktaris_app/presentation/ui/profile/setting/setting_route.dart';
import 'package:aktaris_app/presentation/ui/splash/splash_route.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_history/detail_history_route.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/choose_session/choose_session_route.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/detail_transaction_route.dart';
import 'package:aktaris_app/presentation/ui/transaction/payment/detail_payment_route.dart';
import 'package:aktaris_app/presentation/ui/transaction/transaction_route.dart';
import 'package:aktaris_app/presentation/ui/profile/mitra_notaris/mitra_notaris_route.dart';

class AppPages {
  static final routes = [
    ...splashRoute,
    //auth
    ...registerRoute,
    ...loginRoute,
    ...otpRoute,
    ...resetPasswordRoute,
    ...chooseSessionRoute,
    //dashboard
    ...navbarRoute,
    ...homeRoute,
    ...notarisListRoute,
    //transaction
    ...transactionRoute,
    ...detailTransactionRoute,
    ...detailHistoryRoute,
    //profile
    ...profileRoute,
    ...personalDataRoute,
    ...changePersonalDataRoute,
    ...personalDocRoute,
    ...mitraNotarisRoute,
    ...settingRoute,
    ...changePasswordRoute,
    ...syaratKetentuanRoute,
    ...privacyRoute,
    //chat
    ...chatScreenRoute,
    ...previewFileRoute,
    //UI saja
    ...detailPaymentRoute,
    // ...detailPaymentRoute,
    ...caraBayarRoute,
    ...caraBayarQrRoute,
    ...rincianBayarRoute,
    ...tungguNotarisRoute,
    ...listtransaksiRoute
  ];
}
