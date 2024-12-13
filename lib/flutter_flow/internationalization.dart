import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'kn', 'te', 'ta'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? knText = '',
    String? teText = '',
    String? taText = '',
  }) =>
      [enText, hiText, knText, teText, taText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // startPage
  {
    'tsrvn8bz': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆಯನ್ನು ರಚಿಸಿ',
      'ta': 'கணக்கை உருவாக்கவும்',
      'te': 'ఖాతాను సృష్టించండి',
    },
    '7pql0ptf': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆಯನ್ನು ರಚಿಸಿ',
      'ta': 'கணக்கை உருவாக்கவும்',
      'te': 'ఖాతాను సృష్టించండి',
    },
    'krt27nk6': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': 'आइये नीचे दिया गया फॉर्म भरकर शुरुआत करें।',
      'kn': 'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡುವ ಮೂಲಕ ಪ್ರಾರಂಭಿಸೋಣ.',
      'ta': 'கீழே உள்ள படிவத்தை நிரப்புவதன் மூலம் தொடங்குவோம்.',
      'te': 'దిగువ ఫారమ్‌ను పూరించడం ద్వారా ప్రారంభిద్దాం.',
    },
    'qty8buel': {
      'en': 'Name',
      'hi': 'नाम',
      'kn': 'ಹೆಸರು',
      'ta': 'பெயர்',
      'te': 'పేరు',
    },
    'pt69m35q': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
      'ta': 'மின்னஞ்சல்',
      'te': 'ఇమెయిల్',
    },
    'lq680mrl': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಪಾಸ್ವರ್ಡ್',
      'ta': 'கடவுச்சொல்',
      'te': 'పాస్వర్డ్',
    },
    'ixclj6ss': {
      'en': 'Farmer',
      'hi': 'किसान',
      'kn': 'ರೈತ',
      'ta': 'விவசாயி',
      'te': 'రైతు',
    },
    'onti3ffk': {
      'en': 'Buyer',
      'hi': 'क्रेता',
      'kn': 'ಖರೀದಿದಾರ',
      'ta': 'வாங்குபவர்',
      'te': 'కొనుగోలుదారు',
    },
    'wg9mn2o5': {
      'en': 'User Type',
      'hi': 'उपयोगकर्ता का प्रकार',
      'kn': 'ಬಳಕೆದಾರರ ಪ್ರಕಾರ',
      'ta': 'பயனர் வகை',
      'te': 'వినియోగదారు రకం',
    },
    '5vcsnowm': {
      'en': 'Search...',
      'hi': 'खोज...',
      'kn': 'ಹುಡುಕು...',
      'ta': 'தேடு...',
      'te': 'శోధన...',
    },
    'b1sonaj7': {
      'en': 'Get Started',
      'hi': 'शुरू हो जाओ',
      'kn': 'ಪ್ರಾರಂಭಿಸಿ',
      'ta': 'தொடங்குங்கள்',
      'te': 'ప్రారంభించండి',
    },
    'f5sdcsds': {
      'en': 'Log In',
      'hi': 'लॉग इन करें',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
      'ta': 'உள்நுழைக',
      'te': 'లాగిన్ చేయండి',
    },
    'r7zlp6os': {
      'en': 'Welcome Back',
      'hi': 'वापसी पर स्वागत है',
      'kn': 'ಮರಳಿ ಸ್ವಾಗತ',
      'ta': 'மீண்டும் வரவேற்கிறோம்',
      'te': 'తిరిగి స్వాగతం',
    },
    'r6avag43': {
      'en': 'Fill out the information below in order to access your account.',
      'hi': 'अपने खाते तक पहुंचने के लिए नीचे दी गई जानकारी भरें।',
      'kn': 'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಪ್ರವೇಶಿಸಲು ಕೆಳಗಿನ ಮಾಹಿತಿಯನ್ನು ಭರ್ತಿ ಮಾಡಿ.',
      'ta': 'உங்கள் கணக்கை அணுக, கீழே உள்ள தகவலை நிரப்பவும்.',
      'te': 'మీ ఖాతాను యాక్సెస్ చేయడానికి దిగువ సమాచారాన్ని పూరించండి.',
    },
    '8431h0qz': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
      'ta': 'மின்னஞ்சல்',
      'te': 'ఇమెయిల్',
    },
    'xxpywwkc': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಪಾಸ್ವರ್ಡ್',
      'ta': 'கடவுச்சொல்',
      'te': 'పాస్వర్డ్',
    },
    'ycoij0cv': {
      'en': 'Sign In',
      'hi': 'दाखिल करना',
      'kn': 'ಸೈನ್ ಇನ್ ಮಾಡಿ',
      'ta': 'உள்நுழையவும்',
      'te': 'సైన్ ఇన్ చేయండి',
    },
    'yk6lwpd7': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
      'ta': 'வீடு',
      'te': 'హోమ్',
    },
  },
  // fORb
  {
    'bb68hndd': {
      'en':
          'Your reliable partner in achieving sustainable farming success. Let’s work together to build a stable, profitable future in agriculture!',
      'hi':
          'टिकाऊ खेती में सफलता पाने में आपका भरोसेमंद साथी। आइए, कृषि में एक स्थिर, लाभदायक भविष्य बनाने के लिए मिलकर काम करें!',
      'kn':
          'ಸುಸ್ಥಿರ ಕೃಷಿ ಯಶಸ್ಸನ್ನು ಸಾಧಿಸುವಲ್ಲಿ ನಿಮ್ಮ ವಿಶ್ವಾಸಾರ್ಹ ಪಾಲುದಾರ. ಕೃಷಿಯಲ್ಲಿ ಸ್ಥಿರವಾದ, ಲಾಭದಾಯಕ ಭವಿಷ್ಯವನ್ನು ನಿರ್ಮಿಸಲು ಒಟ್ಟಾಗಿ ಕೆಲಸ ಮಾಡೋಣ!',
      'ta':
          'நிலையான விவசாய வெற்றியை அடைவதில் உங்கள் நம்பகமான பங்குதாரர். விவசாயத்தில் நிலையான, லாபகரமான எதிர்காலத்தை உருவாக்க ஒன்றிணைவோம்!',
      'te':
          'స్థిరమైన వ్యవసాయ విజయాన్ని సాధించడంలో మీ నమ్మకమైన భాగస్వామి. వ్యవసాయంలో స్థిరమైన, లాభదాయకమైన భవిష్యత్తును నిర్మించేందుకు కలిసి పనిచేద్దాం!',
    },
    'w49sy4zz': {
      'en': 'Let\'s go',
      'hi': 'चल दर',
      'kn': 'ಹೋಗೋಣ',
      'ta': 'போகலாம்',
      'te': 'వెళ్దాం',
    },
  },
  // farmerD
  {
    'co3c7jpe': {
      'en': 'Hi!! ',
      'hi': 'नमस्ते!!',
      'kn': 'ನಮಸ್ತೆ!!',
      'ta': 'ஹாய்!!',
      'te': 'హాయ్!!',
    },
    'iikynvbi': {
      'en': 'A',
      'hi': 'ए',
      'kn': 'ಎ',
      'ta': 'ஏ',
      'te': 'ఎ',
    },
    'fvoo0ls7': {
      'en': 'Ongoing Contracts',
      'hi': 'चालू अनुबंध',
      'kn': 'ಚಾಲ್ತಿಯಲ್ಲಿರುವ ಒಪ್ಪಂದಗಳು',
      'ta': 'நடந்துகொண்டிருக்கும் ஒப்பந்தங்கள்',
      'te': 'కొనసాగుతున్న ఒప్పందాలు',
    },
    'sw9r6mky': {
      'en': 'Completed Contracts',
      'hi': 'पूर्ण हो चुके अनुबंध',
      'kn': 'ಪೂರ್ಣಗೊಂಡ ಒಪ್ಪಂದಗಳು',
      'ta': 'முடிக்கப்பட்ட ஒப்பந்தங்கள்',
      'te': 'పూర్తి చేసిన ఒప్పందాలు',
    },
    '2hbxdut8': {
      'en': 'CROP LISTING',
      'hi': 'फसल सूची',
      'kn': 'ಕ್ರಾಪ್ ಲಿಸ್ಟಿಂಗ್',
      'ta': 'பயிர் பட்டியல்',
      'te': 'క్రాప్ లిస్టింగ్',
    },
    'wachdqxj': {
      'en': 'edit',
      'hi': 'संपादन करना',
      'kn': 'ಸಂಪಾದಿಸು',
      'ta': 'திருத்த',
      'te': 'సవరించు',
    },
    'pi49skwz': {
      'en': 'Contract Requests',
      'hi': 'अनुबंध अनुरोध',
      'kn': 'ಒಪ್ಪಂದದ ವಿನಂತಿಗಳು',
      'ta': 'ஒப்பந்த கோரிக்கைகள்',
      'te': 'కాంట్రాక్ట్ అభ్యర్థనలు',
    },
    'zzxqzxnq': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
      'ta': 'வீடு',
      'te': 'హోమ్',
    },
  },
  // buyerD
  {
    '8js579va': {
      'en': 'Hi!!',
      'hi': 'नमस्ते!!',
      'kn': 'ನಮಸ್ತೆ!!',
      'ta': 'ஹாய்!!',
      'te': 'హాయ్!!',
    },
    'paizoczo': {
      'en': 'A',
      'hi': 'ए',
      'kn': 'ಎ',
      'ta': 'ஏ',
      'te': 'ఎ',
    },
    'u174zl7a': {
      'en': 'Active Contracts',
      'hi': 'सक्रिय अनुबंध',
      'kn': 'ಸಕ್ರಿಯ ಒಪ್ಪಂದಗಳು',
      'ta': 'செயலில் உள்ள ஒப்பந்தங்கள்',
      'te': 'క్రియాశీల ఒప్పందాలు',
    },
    'sqh6wvnf': {
      'en': 'List of crops available',
      'hi': 'उपलब्ध फसलों की सूची',
      'kn': 'ಲಭ್ಯವಿರುವ ಬೆಳೆಗಳ ಪಟ್ಟಿ',
      'ta': 'கிடைக்கும் பயிர்களின் பட்டியல்',
      'te': 'అందుబాటులో ఉన్న పంటల జాబితా',
    },
    'n5bucabu': {
      'en': 'search for crops below',
      'hi': 'नीचे फसलों की खोज करें',
      'kn': 'ಕೆಳಗಿನ ಬೆಳೆಗಳಿಗಾಗಿ ಹುಡುಕಿ',
      'ta': 'கீழே பயிர்களைத் தேடுங்கள்',
      'te': 'దిగువ పంటల కోసం శోధించండి',
    },
    'okbuhj07': {
      'en': 'Search',
      'hi': 'खोज',
      'kn': 'ಹುಡುಕು',
      'ta': 'தேடு',
      'te': 'శోధించండి',
    },
    't6vgemvf': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
      'kn': 'ಆಯ್ಕೆ 1',
      'ta': 'விருப்பம் 1',
      'te': 'ఎంపిక 1',
    },
    '4iep4c55': {
      'en': 'Search results',
      'hi': 'खोज के परिणाम',
      'kn': 'ಹುಡುಕಾಟ ಫಲಿತಾಂಶಗಳು',
      'ta': 'தேடல் முடிவுகள்',
      'te': 'శోధన ఫలితాలు',
    },
    '9s8f60ql': {
      'en': 'Available: ',
      'hi': 'उपलब्ध:',
      'kn': 'ಲಭ್ಯವಿದೆ:',
      'ta': 'கிடைக்கும்:',
      'te': 'అందుబాటులో ఉంది:',
    },
    'uf21emle': {
      'en': 'kg',
      'hi': 'किलोग्राम',
      'kn': 'ಕೆ.ಜಿ',
      'ta': 'கிலோ',
      'te': 'కిలో',
    },
    'kbwccjcl': {
      'en': ' / per kg',
      'hi': '/ प्रति किलोग्राम',
      'kn': '/ ಪ್ರತಿ ಕೆ.ಜಿ',
      'ta': '/ ஒரு கிலோ',
      'te': '/ కిలోకి',
    },
    'syoosc4f': {
      'en': 'details',
      'hi': 'विवरण',
      'kn': 'ವಿವರಗಳು',
      'ta': 'விவரங்கள்',
      'te': 'వివరాలు',
    },
    '0vyubv79': {
      'en': 'Available: ',
      'hi': 'उपलब्ध:',
      'kn': 'ಲಭ್ಯವಿದೆ:',
      'ta': 'கிடைக்கும்:',
      'te': 'అందుబాటులో ఉంది:',
    },
    '0ixnzbe5': {
      'en': 'kg',
      'hi': 'किलोग्राम',
      'kn': 'ಕೆ.ಜಿ',
      'ta': 'கிலோ',
      'te': 'కిలో',
    },
    'zidbloqh': {
      'en': ' / per kg',
      'hi': '/ प्रति किलोग्राम',
      'kn': '/ ಪ್ರತಿ ಕೆ.ಜಿ',
      'ta': '/ ஒரு கிலோ',
      'te': '/ కిలోకి',
    },
    'w7i37x9x': {
      'en': 'details',
      'hi': 'विवरण',
      'kn': 'ವಿವರಗಳು',
      'ta': 'விவரங்கள்',
      'te': 'వివరాలు',
    },
    'wmh5tamc': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
      'ta': 'வீடு',
      'te': 'హోమ్',
    },
  },
  // fContracts
  {
    '1tkmdb6e': {
      'en': 'My Contracts',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'f89htzqa': {
      'en': 'Buyer Name: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'dbq9jxt5': {
      'en': 'Crop Type: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '7hnbdbwu': {
      'en': 'Quantity: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '2kxaymqm': {
      'en': 'Negotiated Price: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'sze6bhdh': {
      'en': 'Contracts',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // addCrop
  {
    'idbk4jjz': {
      'en': 'Add your crop here',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'dfazfdn5': {
      'en': 'Crop Type',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'sxnidllj': {
      'en': 'Quantity (in kgs)',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'yumu333p': {
      'en': 'Price per Unit',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ah7ihb63': {
      'en': 'Pick Date',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '8s9n1qyq': {
      'en': 'Description',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'igge5ecw': {
      'en': 'Upload Image',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'sqwpce2t': {
      'en': 'Add Crop',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'zrxhyiz3': {
      'en': 'addCrops',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // fPayment
  {
    'wmdwb4cw': {
      'en': 'Payments',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'q1uxrxeq': {
      'en': 'Contract with:',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'b5r0dhf4': {
      'en': 'Crop Type:',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'erkd9rda': {
      'en': 'Not done',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'sglaaeeu': {
      'en': 'Done',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'j5calmg3': {
      'en': 'Payment',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // fProfile
  {
    'czjmnj5x': {
      'en': 'Farmer Photo',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'rqpbzx75': {
      'en': 'Name:',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'sw8lesji': {
      'en': 'Email: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '0fcm350x': {
      'en': 'Phno.',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'wrbephju': {
      'en': 'Address: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '5zinz0o6': {
      'en': 'TextField',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'maloerki': {
      'en': 'aadhar',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ex6jovcm': {
      'en': 'Profile',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // bContracts
  {
    'mfffqdvi': {
      'en': 'My Contracts',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '13tx5ccm': {
      'en': 'Farmer Name: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '7exl06zd': {
      'en': 'Crop Type: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '1g16yq88': {
      'en': 'Quantity: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '8my43mtn': {
      'en': 'Negotiated Price: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '6acxqcy9': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // createContract
  {
    'z5mhrcaq': {
      'en': 'Contract Creation',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ke98khl1': {
      'en': 'Negotiable Price',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'v2p4st1q': {
      'en': 'Pick Date',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '5o9mg5gr': {
      'en': 'Payment Terms',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'k9v3xsau': {
      'en': 'Quality Terms',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'rvnfyj5l': {
      'en': 'Notes (if any)',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'zx943qcq': {
      'en': 'Submit Contract',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '4s0zr7ou': {
      'en': 'Legal Consultation',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'u49xqdph': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // bPayment
  {
    'ualfuuln': {
      'en': 'Payments',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'kl3wvhdd': {
      'en': 'Crop Type:',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '2qq0xk9d': {
      'en': 'Amount to be paid:',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'qu21fi1z': {
      'en': 'Payment pending',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'kt3f68i6': {
      'en': 'Payment Done',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'oswen55d': {
      'en': 'Make Payment',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'kwgp2u01': {
      'en': 'Payment done!!',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '1bin9l2x': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // cropDetails
  {
    'ip5eqlyl': {
      'en': 'Crop Details',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'hpg6a60z': {
      'en': 'Crop Type: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ispt4sfv': {
      'en': 'Available stock: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ril8zy06': {
      'en': 'Price per Unit: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'maez5x7n': {
      'en': 'Description: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ilj7vhcq': {
      'en': 'Contact Farmer',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'w7nnfe6p': {
      'en': 'Create Contract',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '6p41022p': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // editCropDetails
  {
    'ffuytlki': {
      'en': 'Crop Type: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'xtbp726f': {
      'en': 'Save',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '1bua18nz': {
      'en': 'Quantity:',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'h48vtku5': {
      'en': 'Save',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'bw24j2w6': {
      'en': 'Price per Unit: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'tgdwi4n8': {
      'en': 'Save',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'cg36e68s': {
      'en': 'Status:',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'khf22jgo': {
      'en': 'Save',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '847aouxf': {
      'en': 'Delete Crop',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    't8vhly29': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // fContractRequest
  {
    'pb3nb8jo': {
      'en': 'Decline',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '8ox86jbn': {
      'en': 'Contact',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'zmr7femg': {
      'en': 'Accept',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'x748ewfn': {
      'en': 'Contract Requests',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '6xy0me94': {
      'en': 'Legal consultation',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'vgkuc6c9': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // contractVerification
  {
    '9joytobf': {
      'en': 'Contract Verification',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'y4yg9z66': {
      'en': 'Please verify your identity',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'etp6gju8': {
      'en':
          'To proceed with the contract verification, we need to confirm your identity. Please enter your full name as it appears on your official documents.',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'j4y8bew7': {
      'en': 'Full Name',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'jn0ov288': {
      'en': 'Important Notice',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'c0lqq4b4': {
      'en': 'By entering your name and proceeding, you acknowledge that:',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'n00orla5': {
      'en':
          'The information you provide is accurate and true to the best of your knowledge.',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'dh4e19ge': {
      'en': 'You are legally authorized to enter into this contract.',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'xx6r2tfm': {
      'en':
          'You understand that providing false information may result in legal consequences.',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '2c5j3iro': {
      'en': 'Verify and Proceed',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'gvsp8iai': {
      'en':
          'If you have any questions or concerns about this process, please contact our support team.',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // updateInfo
  {
    'qpgm2jd1': {
      'en': 'Complete Your Profile',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'y8afcwto': {
      'en': 'Please provide the following information to set up your account.',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'dd6tpj24': {
      'en': 'Profile Photo',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '471a5gzr': {
      'en': 'Tap to upload',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'z6t65y29': {
      'en': 'Phone Number',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'v4lp9e6t': {
      'en': 'Address',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ft9029ep': {
      'en': 'Save Profile',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // bprofile
  {
    'exsdlkk4': {
      'en': 'Edit Profile',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '0s74r48i': {
      'en': 'Full Name',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ntseyx7i': {
      'en': 'Phone Number',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'xu57c5ca': {
      'en': 'Email Address',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'fiy57pa8': {
      'en': 'Address',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'oppvqtlm': {
      'en': 'Save Changes',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // fchats
  {
    '7u9u69dg': {
      'en': 'Type a message',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'jo3epbez': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // bNotifications
  {
    'vmrj58o1': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // fpro
  {
    'y3pms6d1': {
      'en': 'Edit Profile',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'qkm9du1p': {
      'en': 'Full Name',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'zkvzczss': {
      'en': 'Phone Number',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'c690h00m': {
      'en': 'Email Address',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '1zppuqkl': {
      'en': 'Address',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'j12yyk4c': {
      'en': 'Save Changes',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'tuyigo9h': {
      'en': 'Aadhar Verification',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // aadharPage
  {
    'ani3bye0': {
      'en': 'Aadhar Verification',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'xs7m6nsi': {
      'en': 'Aadhar No.',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'bstcddll': {
      'en': '#### #### ####',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'maprdg98': {
      'en': 'Verify',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '70ozluw4': {
      'en': 'Aadhar Details',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '5vueoeuh': {
      'en': 'Go back',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'cyfjikc7': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
      'ta': 'வீடு',
      'te': 'హోమ్',
    },
  },
  // bpro
  {
    '1xoq0jal': {
      'en': 'Edit Profile',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '1mgvtyv7': {
      'en': 'Full Name',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '8r5c5klb': {
      'en': 'Phone Number',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'iir6rmb5': {
      'en': 'Email Address',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '5ac0lh9g': {
      'en': 'Address',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'kt1qj464': {
      'en': 'Save Changes',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // otpPage
  {
    'x0wrfre9': {
      'en': 'Verify OTP',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '8rggw4bu': {
      'en': 'Enter the 6-digit code sent to your phone',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '6fps5nb7': {
      'en': 'Enter OTP',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '2y1jn2eb': {
      'en': 'Verify',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // bUpi
  {
    'zypdf0lg': {
      'en': 'Payment Page',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'yzxbrwvu': {
      'en': 'Buyer Name:',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'v4cv0hlc': {
      'en': 'paying to',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '46x5zq5c': {
      'en': 'Farmer Name:',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'z4x0rtf2': {
      'en': 'Amount: ',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'iv3o3vu2': {
      'en': 'UPI Payment',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'nkitduj1': {
      'en': 'Enter PIN',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'cy4geca4': {
      'en': 'Make Payment',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'f696p0hc': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
      'ta': 'வீடு',
      'te': 'హోమ్',
    },
  },
  // logout
  {
    'ifyxj494': {
      'en': 'Account Information',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'y2c3am06': {
      'en': 'Log Out',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // customNavBar
  {
    'iyraqa5n': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'nrpp09du': {
      'en': 'Contracts',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ziqwoax9': {
      'en': 'Add Crop',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'zfxbcbyz': {
      'en': 'Payment',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'mt9w021n': {
      'en': 'Profile',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // cropUploadSuccess
  {
    'pqskgwg5': {
      'en': 'Crop Uploaded',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'jn35cnqy': {
      'en': 'Your crop data has been successfully uploaded',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // customNavBarB
  {
    '7va3aeif': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'a8vn02th': {
      'en': 'Notifications',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'c53b68f7': {
      'en': 'My Contracts',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '5obbklav': {
      'en': 'Payment',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'yu42zffy': {
      'en': 'Profile',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // noCropFound
  {
    'qy3rfpt9': {
      'en': 'No Crops Listed',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'xamljzet': {
      'en':
          'You haven\'t added any crops to your listing yet. Start by adding your first crop!',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '5vp1c2rf': {
      'en': 'Add Your First Crop',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // noCropFoundB
  {
    'j5mesxko': {
      'en': 'No Crops Listed',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // noContractFound
  {
    'fstf6fmw': {
      'en': 'No Contract Found',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'wse4gxx3': {
      'en':
          'We couldn\'t find any pending contracts associated with your account. Please check back later or contact support if you believe this is an error.',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
  // Miscellaneous
  {
    'r4es90z2': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '253bghuu': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'kjonlzyl': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '7qzpe7ua': {
      'en': 'Please give permission to your location',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '4pkgyz8x': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ipbn0079': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '3or03w8c': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'oonj7hcl': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'x7nn019c': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'gw3mu1hd': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '0hpmsbj4': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'v5ythz9m': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'g2zs60w4': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '95kl20nw': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'gfvm99sk': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '4k6g010t': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ik43z8pc': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    't2x8na4z': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'llh2bgu9': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'ql52keis': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'yqrzpyme': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'uzmxjrfo': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '69psznh7': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'moclzv1d': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'womm0pdo': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    'zzqulxvy': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '100h3d2p': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '1dg29ow7': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
    '58t7v30w': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
      'te': '',
    },
  },
].reduce((a, b) => a..addAll(b));
