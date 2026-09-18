import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @title_onboarding1.
  ///
  /// In en, this message translates to:
  /// **'Diverse & sparkling food.'**
  String get title_onboarding1;

  /// No description provided for @error_text.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get error_text;

  /// No description provided for @no_restaurant_text.
  ///
  /// In en, this message translates to:
  /// **'No restaurant available'**
  String get no_restaurant_text;

  /// No description provided for @subtitle_onboarding1.
  ///
  /// In en, this message translates to:
  /// **'We use the best local ingredients to create fresh and delicious food and drinks.'**
  String get subtitle_onboarding1;

  /// No description provided for @title_onboarding2.
  ///
  /// In en, this message translates to:
  /// **'Free shipping on all orders'**
  String get title_onboarding2;

  /// No description provided for @subtitle_onboarding2.
  ///
  /// In en, this message translates to:
  /// **'Free shipping on the primary order whilst the usage of CaPay fee method.'**
  String get subtitle_onboarding2;

  /// No description provided for @title_onboarding3.
  ///
  /// In en, this message translates to:
  /// **'+24K Restaurants'**
  String get title_onboarding3;

  /// No description provided for @subtitle_onboarding3.
  ///
  /// In en, this message translates to:
  /// **'Easily find your favorite food and have it delivered in record time.'**
  String get subtitle_onboarding3;

  /// No description provided for @next_button.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next_button;

  /// No description provided for @started_button.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get started_button;

  /// No description provided for @title_login.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get title_login;

  /// No description provided for @subtitle_login.
  ///
  /// In en, this message translates to:
  /// **'Hello, sign in to continue! Or '**
  String get subtitle_login;

  /// No description provided for @create_account_button.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get create_account_button;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email_hint;

  /// No description provided for @password_hint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password_hint;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in_button;

  /// No description provided for @forgot_password_button.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_password_button;

  /// No description provided for @connect_google_button.
  ///
  /// In en, this message translates to:
  /// **'Connect with Google'**
  String get connect_google_button;

  /// No description provided for @title_register.
  ///
  /// In en, this message translates to:
  /// **'Hello! Create Account'**
  String get title_register;

  /// No description provided for @subtitle_register.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get subtitle_register;

  /// No description provided for @your_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get your_name_hint;

  /// No description provided for @phone_number_hint.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number_hint;

  /// No description provided for @register_button.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register_button;

  /// No description provided for @title_enter_code.
  ///
  /// In en, this message translates to:
  /// **'Verify your identity'**
  String get title_enter_code;

  /// No description provided for @subtitle_enter_code.
  ///
  /// In en, this message translates to:
  /// **'We have sent a code to '**
  String get subtitle_enter_code;

  /// No description provided for @search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search on Coody'**
  String get search_hint;

  /// No description provided for @filter_button.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter_button;

  /// No description provided for @delivery_to.
  ///
  /// In en, this message translates to:
  /// **'Delivery to'**
  String get delivery_to;

  /// No description provided for @address_delivery.
  ///
  /// In en, this message translates to:
  /// **'1014 Prospect Valley'**
  String get address_delivery;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get see_all;

  /// No description provided for @best_partners.
  ///
  /// In en, this message translates to:
  /// **'Best partners'**
  String get best_partners;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @distance_restaurant.
  ///
  /// In en, this message translates to:
  /// **'1.5km'**
  String get distance_restaurant;

  /// No description provided for @free_ship.
  ///
  /// In en, this message translates to:
  /// **'Free ship'**
  String get free_ship;

  /// No description provided for @near_by.
  ///
  /// In en, this message translates to:
  /// **'Nearby'**
  String get near_by;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @fast.
  ///
  /// In en, this message translates to:
  /// **'Fast'**
  String get fast;

  /// No description provided for @sort_by.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sort_by;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @filtered_restaurant_text.
  ///
  /// In en, this message translates to:
  /// **'Filtered Restaurants'**
  String get filtered_restaurant_text;

  /// No description provided for @home_label.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home_label;

  /// No description provided for @compass_label.
  ///
  /// In en, this message translates to:
  /// **'Compass'**
  String get compass_label;

  /// No description provided for @order_label.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order_label;

  /// No description provided for @profile_label.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile_label;

  /// No description provided for @restaurant_id_key.
  ///
  /// In en, this message translates to:
  /// **'restaurantId'**
  String get restaurant_id_key;

  /// No description provided for @restaurant_name_key.
  ///
  /// In en, this message translates to:
  /// **'restaurantName'**
  String get restaurant_name_key;

  /// No description provided for @restaurant_image_key.
  ///
  /// In en, this message translates to:
  /// **'restaurantImage'**
  String get restaurant_image_key;

  /// No description provided for @has_take_away_key.
  ///
  /// In en, this message translates to:
  /// **'hasTakeAway'**
  String get has_take_away_key;

  /// No description provided for @is_favorite_key.
  ///
  /// In en, this message translates to:
  /// **'isFavorite'**
  String get is_favorite_key;

  /// No description provided for @recommended_text.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended_text;

  /// No description provided for @fastest_delivery_text.
  ///
  /// In en, this message translates to:
  /// **'Fastest Delivery'**
  String get fastest_delivery_text;

  /// No description provided for @most_popular_text.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get most_popular_text;

  /// No description provided for @max_delivery_fee_text.
  ///
  /// In en, this message translates to:
  /// **'Max Delivery Fee'**
  String get max_delivery_fee_text;

  /// No description provided for @max_fee_text.
  ///
  /// In en, this message translates to:
  /// **'\$100'**
  String get max_fee_text;

  /// No description provided for @min_fee_text.
  ///
  /// In en, this message translates to:
  /// **'\$0.0'**
  String get min_fee_text;

  /// No description provided for @take_away_badge.
  ///
  /// In en, this message translates to:
  /// **'Take Away'**
  String get take_away_badge;

  /// No description provided for @minute_text.
  ///
  /// In en, this message translates to:
  /// **'mins'**
  String get minute_text;

  /// No description provided for @no_voucher_text.
  ///
  /// In en, this message translates to:
  /// **'No Voucher Available'**
  String get no_voucher_text;

  /// No description provided for @delivery_text.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery_text;

  /// No description provided for @review_text.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review_text;

  /// No description provided for @available_text.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available_text;

  /// No description provided for @no_available_text.
  ///
  /// In en, this message translates to:
  /// **'No Available'**
  String get no_available_text;

  /// No description provided for @no_combo_text.
  ///
  /// In en, this message translates to:
  /// **'No combo'**
  String get no_combo_text;

  /// No description provided for @like_text.
  ///
  /// In en, this message translates to:
  /// **'likes'**
  String get like_text;

  /// No description provided for @add_to_cart_text_button.
  ///
  /// In en, this message translates to:
  /// **'Add to Order'**
  String get add_to_cart_text_button;

  /// No description provided for @confirm_order_title.
  ///
  /// In en, this message translates to:
  /// **'Comfirm Order'**
  String get confirm_order_title;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
