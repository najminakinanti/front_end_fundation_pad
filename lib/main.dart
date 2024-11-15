import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/mitra_page/bookmark_page_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/create_new_password_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/daftar_sponsor_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/detail_chat_event_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/detail_chat_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/detail_event_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/edit_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/edit_password_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/event_page_by_category_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/event_page_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/forgot_password_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/forgot_password_new_password_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/forgot_password_verification_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/event_by_category_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/home_mitra/main_page_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/home_mitra/profile_page_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/kirim_sponsor_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/ubah_data_profile.dart';
import 'package:pad_fundation/pages/mitra_page/ubah_email.dart';
import 'package:pad_fundation/pages/mitra_page/ubah_nama.dart';
import 'package:pad_fundation/pages/mitra_page/ubah_nomor.dart';
import 'package:pad_fundation/pages/not_logged_in/detail_event.dart';
import 'package:pad_fundation/pages/not_logged_in/event_by_category.dart';
import 'package:pad_fundation/pages/not_logged_in/home/main_page.dart';
import 'package:pad_fundation/pages/mitra_page/login_page_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/register_page_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/register_page_mitra_add.dart';
import 'package:pad_fundation/pages/organizer_page/add_kontraprestasi.dart';
import 'package:pad_fundation/pages/organizer_page/all_event_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/bookmark_page_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/create_new_password_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/daftar_sponsor_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/data_penerima.dart';
import 'package:pad_fundation/pages/organizer_page/detail_chat_event_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/detail_chat_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/detail_event_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/detail_my_event_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/edit_event_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/edit_kontraprestasi.dart';
import 'package:pad_fundation/pages/organizer_page/edit_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/edit_password_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/event_by_category_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/event_page_by_category_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/forgot_password_new_password_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/forgot_password_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/forgot_password_verification_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/home_organizer/home_page_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/home_organizer/main_page_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/list_transaksi.dart';
import 'package:pad_fundation/pages/organizer_page/login_page_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/nominal.dart';
import 'package:pad_fundation/pages/organizer_page/register_page_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/register_page_organizer_add.dart';
import 'package:pad_fundation/pages/organizer_page/tambah_bukti_kontraprestasi.dart';
import 'package:pad_fundation/pages/organizer_page/ubah_data_profile_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/ubah_email_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/ubah_nama_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/ubah_nomor_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/withdrawal_request_waiting.dart';
import 'package:pad_fundation/pages/organizer_page/withdrawal_request_failed.dart';
import 'package:pad_fundation/pages/organizer_page/withdrawal_request_done.dart';
import 'package:pad_fundation/pages/splash_screen/choose_role.dart';
import 'package:pad_fundation/pages/splash_screen/splash_page.dart';
import 'package:pad_fundation/pages/splash_screen/on_boarding_page_1.dart';
import 'package:pad_fundation/pages/splash_screen/on_boarding_page_2.dart';
import 'package:pad_fundation/pages/splash_screen/on_boarding_page_3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/boarding-1': (context) => OnBoardingPage1(),
        '/boarding-2': (context) => OnBoardingPage2(),
        '/boarding-3': (context) => OnBoardingPage3(),
        '/choose-role': (context) => ChooseRole(),

        // role mitra
        '/login-mitra': (context) => LoginPageMitra(),
        '/forgot-password': (context) => ForgotPasswordMitra(),
        '/verification': (context) => VerificationMitra(),
        '/new-password': (context) => NewPasswordMitra(),
        '/register-mitra': (context) => RegisterPageMitra(),
        '/add-mitra': (context) => AddMitra(),
        '/home-mitra': (context) {
          final int initialIndex = ModalRoute.of(context)!.settings.arguments as int? ?? 0;
          return MainPageMitra(initialIndex: initialIndex);
        },
        '/bookmark-mitra': (context) => BookmarkPageMitra(),
        '/event-mitra': (context) => EventPageMitra(),
        '/event-by-category-mitra': (context) => EventByCategoryMitra(),
        '/event-page-by-category-mitra': (context) => EventPageByCategoryMitra(),
        '/detail-event-mitra': (context) => DetailEventMitra(),
        '/detail-chat-mitra': (context) => DetailChatMitra(),
        '/detail-chat-event-mitra': (context) => DetailChatEventMitra(),
        '/daftar-sponsor-mitra': (context) => DaftarSponsorMitra(),
        '/kirim-sponsor-mitra': (context) => KirimSponsorMitra(),
        '/ubah-data-profile': (context) => UbahDataProfile(),
        '/profile-page-mitra': (context) => ProfilePageMitra(),
        '/ubah-nama': (context) => UbahNama(),
        '/ubah-email': (context) => UbahEmail(),
        '/ubah-nomor': (context) => UbahNomor(),
        '/edit-mitra': (context) => EditMitra(),
        '/edit-password-mitra': (context) => EditPasswordMitra(),
        '/create-new-password-mitra': (context) => CreateNewPasswordMitra(),



        //role organizer
        '/login-organizer': (context) => LoginPageOrganizer(),
        '/forgot-password-organizer': (context) => ForgotPasswordOrganizer(),
        '/verification-organizer': (context) => VerificationOrganizer(),
        '/new-password-organizer': (context) => NewPasswordOrganizer(),
        '/register-organizer': (context) => RegisterPageOrganizer(),
        '/add-organizer': (context) => AddOrganizer(),
        '/home-organizer': (context) {
          final int initialIndex = ModalRoute.of(context)!.settings.arguments as int? ?? 0;
          return MainPageOrganizer(initialIndex: initialIndex);
        },
        '/bookmark-organizer': (context) => BookmarkPageOrganizer(),
        '/detail-chat-organizer': (context) => DetailChatOrganizer(),
        '/detail-chat-event-organizer': (context) => DetailChatEventOrganizer(),
        '/event-by-category-organizer' : (context) => EventByCategoryOrganizer(),
        '/detail-event-organizer': (context) => DetailEventOrganizer(),
        '/event-page-by-category-organizer': (context) => EventPageByCategoryOrganizer(),
        '/ubah-data-profile-organizer': (context) => UbahDataProfileOrganizer(),
        '/ubah-nama-organizer': (context) => UbahNamaOrganizer(),
        '/ubah-email-organizer': (context) => UbahEmailOrganizer(),
        '/ubah-nomor-organizer': (context) => UbahNomorOrganizer(),
        '/edit-password-organizer': (context) => EditPasswordOrganizer(),
        '/create-new-password-organizer': (context) => CreateNewPasswordOrganizer(),
        '/edit-organizer': (context) => EditOrganizer(),
        '/list-transaksi': (context) => ListTransaksi(),
        '/penerima': (context) => DataPenerima(),
        '/nominal': (context) => Nominal(),
        '/withdrawal-req-waiting': (context) => WithdrawalRequestWaiting(),
        '/withdrawal-req-failed': (context) => WithdrawalRequestFailed(),
        '/withdrawal-req-done': (context) => WithdrawalRequestDone(),
        '/all-event-organizer': (context) => AllEventOrganizer(),
        '/daftar-sponsor-organizer': (context) => DaftarSponsorOrganizer(),
        '/detail-my-event-organizer': (context) => DetailMyEventOrganizer(),
        '/ubah-event-organizer': (context) => EditEventOrganizer(),
        '/ubah-kontraprestasi': (context) => EditKontraprestasi(),
        '/add-kontraprestasi': (context) => AddKontraprestasi(),
        '/tambah-bukti-kontraprestasi': (context) => TambahBuktiKontraprestasi(),



        //not logged in
        '/home': (context) {
          final int initialIndex = ModalRoute.of(context)!.settings.arguments as int? ?? 0;
          return MainPage(initialIndex: initialIndex);
        },
        '/detail-event': (context) => DetailEvent(),
        '/event-by-category': (context) => EventByCategory(),
      },
    );
  }
}
