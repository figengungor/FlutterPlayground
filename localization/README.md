# localization

Localization example.
1. Add following to dependencies in pubspec.yaml
    ```
    flutter_localizations:
        sdk: flutter
    ```
2. Add following to dev_dependencies in pubspec.yaml
    ```
    intl_translation: ^0.16.6
    ```
1. First create the `localization.dart` file with `AppLocalization` and
`AppLocalizationDelegate` classes
2. Add your supported languages
inside `AppLocalizationsDelegate`
3. Create a directory named l10n inside lib folder and then run
the following command

     Generic command:

     ```flutter pub pub run intl_translation:extract_to_arb --output-dir=<output directory> <localization file path>```

     Sample:

     ```flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localizations/localizations.dart```

4. The above command will generate `intl_messages.arb` file
which will contain your messages to translate from localization.dart file

    Now, for all languages that you want to support create `intl_<locale_name>.arb`
    files. Actually copy paste `intl_messages.arb` and update the messages part with
    you locale name for example `intl_en.arb`, `intl_tr.arb`. Change the values
    with translations for your messages in each file.

    The resulting translations can be used to generate a set of libraries
    using the `generate_from_arb.dart` program

5. After creating these translated arb files, now it's time to create
Dart files from these:

     Generic command:

     ```flutter pub pub run intl_translation:generate_from_arb --output-dir=<output directory> --no-use-deferred-loading <.arb files> <localization file path>```

     Sample:

     ```flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/intl_en.arb lib/l10n/intl_tr.arb  lib/localizations/localizations.dart```

    This will produce following files inside l10n directory

    messages_all.dart which you should import inside localizations.dart
    messages_<locale_name> for each supported language
    messages_messages.dart

6. Add these properties to your MaterialApp

    ```
     localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('tr', ''),
          ],
    ```

7. Get your messages from AppLocalization as following for example:

    ```
    Text(AppLocalizations.of(context).counterInfoText)
    ```

## Credits & Resources

[Tensor Programming] (https://www.youtube.com/watch?v=IhsHGJEOSYM)

https://github.com/flutter/flutter/blob/master/examples/stocks/lib/main.dart

Why l10n (Localization)?

https://blog.mozilla.org/l10n/2011/12/14/i18n-vs-l10n-whats-the-diff/

Comment in above link: As I understand it, localization means providing user interface
translations in different languages, internationalization is allowing
users to use their native date, number, currency etc. formats.

## Extracting And Using Translated Messages

https://pub.dartlang.org/packages/intl

When your program contains messages that need translation, these must be
extracted from the program source, sent to human translators, and the
results need to be incorporated. The code for this is in the
Intl_translation package.

To extract messages, run the extract_to_arb.dart program.

  `pub run intl_translation:extract_to_arb --output-dir=target/directory
      my_program.dart more_of_my_program.dart`

This will produce a file intl_messages.arb with the messages from all of
these programs. an ARB format file which can be used for input to
translation tools like Google Translator Toolkit. The resulting
translations can be used to generate a set of libraries using the
generate_from_arb.dart program.