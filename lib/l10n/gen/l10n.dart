import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_id.dart';

/// Callers can lookup localized strings with an instance of Lang
/// returned by `Lang.of(context)`.
///
/// Applications need to include `Lang.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Lang.localizationsDelegates,
///   supportedLocales: Lang.supportedLocales,
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
/// be consistent with the languages listed in the Lang.supportedLocales
/// property.
abstract class Lang {
  Lang(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Lang of(BuildContext context) {
    return Localizations.of<Lang>(context, Lang)!;
  }

  static const LocalizationsDelegate<Lang> delegate = _LangDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @goggxi.
  ///
  /// In en, this message translates to:
  /// **'Goggxi'**
  String get goggxi;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @mobileApps.
  ///
  /// In en, this message translates to:
  /// **'Mobile Apps'**
  String get mobileApps;

  /// No description provided for @desktopWeb.
  ///
  /// In en, this message translates to:
  /// **'Desktop & Web'**
  String get desktopWeb;

  /// No description provided for @design.
  ///
  /// In en, this message translates to:
  /// **'Design'**
  String get design;

  /// No description provided for @tutorial.
  ///
  /// In en, this message translates to:
  /// **'Tutorial'**
  String get tutorial;
}

class _LangDelegate extends LocalizationsDelegate<Lang> {
  const _LangDelegate();

  @override
  Future<Lang> load(Locale locale) {
    return SynchronousFuture<Lang>(lookupLang(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_LangDelegate old) => false;
}

Lang lookupLang(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return LangEn();
    case 'id': return LangId();
  }

  throw FlutterError(
    'Lang.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
