library intercom_flutter;

import 'dart:async';

import 'package:intercom_flutter_platform_interface/intercom_flutter_platform_interface.dart';

/// export the [IntercomVisibility] enum
export 'package:intercom_flutter_platform_interface/intercom_flutter_platform_interface.dart'
    show IntercomVisibility;

class Intercom {
  Intercom._();

  /// Function to initialize the Intercom SDK.
  ///
  /// First, you'll need to get your Intercom [appId].
  /// [androidApiKey] is required if you want to use Intercom in Android.
  /// [iosApiKey] is required if you want to use Intercom in iOS.
  ///
  /// You can get these from Intercom settings:
  /// * [Android](https://app.intercom.com/a/apps/_/settings/android)
  /// * [iOS](https://app.intercom.com/a/apps/_/settings/ios)
  ///
  /// Then, initialize Intercom in main method.
  static Future<void> initialize(
    String appId, {
    String? androidApiKey,
    String? iosApiKey,
  }) {
    return IntercomFlutterPlatform.instance
        .initialize(appId, androidApiKey: androidApiKey, iosApiKey: iosApiKey);
  }

  /// You can check how many unread conversations a user has
  /// even if a user dismisses a notification.
  ///
  /// You can listen for unread conversation count with this method.
  static Stream<dynamic> getUnreadStream() {
    return IntercomFlutterPlatform.instance.getUnreadStream();
  }

  /// This method allows you to set a fixed bottom padding for in app messages and the launcher.
  ///
  /// It is useful if your app has a tab bar or similar UI at the bottom of your window.
  /// [padding] is the size of the bottom padding in points.
  static Future<void> setBottomPadding(int padding) {
    return IntercomFlutterPlatform.instance.setBottomPadding(padding);
  }

  /// To make sure that conversations between you and your users are kept private
  /// and that one user can't impersonate another then you need you need to setup
  /// the identity verification.
  ///
  /// This function helps to set up the identity verification.
  /// Here you need to pass hash (HMAC) of the user.
  ///
  /// This must be called before registering the user in Intercom.
  ///
  /// To generate the user hash (HMAC) see
  /// <https://gist.github.com/thewheat/7342c76ade46e7322c3e>
  ///
  /// Note: identity verification does not apply to unidentified users.
  static Future<void> setUserHash(String userHash) {
    return IntercomFlutterPlatform.instance.setUserHash(userHash);
  }

  /// Function to create a identified user in Intercom.
  /// You need to register your users before you can talk to them and
  /// track their activity in your app.
  ///
  /// You can register a identified user either with [userId] or with [email],
  /// but not with both.
  static Future<void> registerIdentifiedUser({String? userId, String? email}) {
    return IntercomFlutterPlatform.instance
        .registerIdentifiedUser(userId: userId, email: email);
  }

  /// Function to create a unidentified user in Intercom.
  /// You need to register your users before you can talk to them and
  /// track their activity in your app.
  static Future<void> registerUnidentifiedUser() {
    return IntercomFlutterPlatform.instance.registerUnidentifiedUser();
  }

  /// Updates the attributes of the current Intercom user.
  ///
  /// The [signedUpAt] param should be seconds since epoch.
  ///
  /// The [language] param should be an an ISO 639-1 two-letter code such as `en` for English or `fr` for French.
  /// You’ll need to use a four-letter code for Chinese like `zh-CN`.
  /// check this link https://www.intercom.com/help/en/articles/180-localize-intercom-to-work-with-multiple-languages.
  ///
  /// See also:
  ///  * [Localize Intercom to work with multiple languages](https://www.intercom.com/help/en/articles/180-localize-intercom-to-work-with-multiple-languages)
  static Future<void> updateUser({
    String? email,
    String? name,
    String? phone,
    String? company,
    String? companyId,
    String? userId,
    int? signedUpAt,
    String? language,
    Map<String, dynamic>? customAttributes,
  }) {
    return IntercomFlutterPlatform.instance.updateUser(
      email: email,
      name: name,
      phone: phone,
      company: company,
      companyId: companyId,
      userId: userId,
      signedUpAt: signedUpAt,
      language: language,
      customAttributes: customAttributes,
    );
  }

  /// To logout a user from Intercom.
  /// This clears the Intercom SDK's cache of your user's identity.
  static Future<void> logout() {
    return IntercomFlutterPlatform.instance.logout();
  }

  /// To hide or show the standard launcher on the bottom right-hand side of the screen.
  static Future<void> setLauncherVisibility(IntercomVisibility visibility) {
    return IntercomFlutterPlatform.instance.setLauncherVisibility(visibility);
  }

  /// You can check how many unread conversations a user has
  /// even if a user dismisses a notification.
  ///
  /// You can get the current unread conversation count with this method.
  static Future<int> unreadConversationCount() {
    return IntercomFlutterPlatform.instance.unreadConversationCount();
  }

  /// To allow or prevent in app messages from popping up in certain parts of your app.
  static Future<void> setInAppMessagesVisibility(
      IntercomVisibility visibility) {
    return IntercomFlutterPlatform.instance
        .setInAppMessagesVisibility(visibility);
  }

  /// To open the Intercom messenger.
  ///
  /// This is used when you manually want to launch Intercom messenger.
  /// for e.g: from your custom launcher (Help & Support) or (Talk to us).
  static Future<void> displayMessenger() {
    return IntercomFlutterPlatform.instance.displayMessenger();
  }

  /// To close the Intercom messenger.
  ///
  /// This is used when you manually want to close Intercom messenger.
  static Future<void> hideMessenger() {
    return IntercomFlutterPlatform.instance.hideMessenger();
  }

  /// To display an Activity with your Help Center content.
  ///
  /// Make sure Help Center is turned on.
  /// If you don't have Help Center enabled in your Intercom settings the method
  /// displayHelpCenter will fail to load.
  static Future<void> displayHelpCenter() {
    return IntercomFlutterPlatform.instance.displayHelpCenter();
  }

  /// To log events in Intercom that record what users do in your app and when they do it.
  /// For example, you can record when user opened a specific screen in your app.
  /// You can also pass [metaData] about the event.
  static Future<void> logEvent(String name, [Map<String, dynamic>? metaData]) {
    return IntercomFlutterPlatform.instance.logEvent(name, metaData);
  }

  /// The [token] to send to the Intercom to receive the notifications.
  ///
  /// For the Android, this [token] must be a FCM (Firebase cloud messaging) token.
  /// For the iOS, this [token] must be a APNS token.
  static Future<void> sendTokenToIntercom(String token) {
    return IntercomFlutterPlatform.instance.sendTokenToIntercom(token);
  }

  /// When a user taps on a push notification Intercom hold onto data
  /// such as the URI in your message or the conversation to open.
  ///
  /// When you want Intercom to act on that data, use this method.
  static Future<void> handlePushMessage() {
    return IntercomFlutterPlatform.instance.handlePushMessage();
  }

  /// To open the Intercom messenger to the composer screen with [message]
  /// field pre-populated.
  static Future<void> displayMessageComposer(String message) {
    return IntercomFlutterPlatform.instance.displayMessageComposer(message);
  }

  /// To check if the push [message] is for Intercom or not.
  /// This is useful when your app is also configured to receive push messages
  /// from third parties.
  static Future<bool> isIntercomPush(Map<String, dynamic> message) async {
    return IntercomFlutterPlatform.instance.isIntercomPush(message);
  }

  /// If the push [message] is for Intercom then use this method to let
  /// Intercom handle that push.
  static Future<void> handlePush(Map<String, dynamic> message) async {
    return IntercomFlutterPlatform.instance.handlePush(message);
  }

  /// To display an Article, pass in an [articleId] from your Intercom workspace.
  ///
  /// An article must be ‘live’ to be used in this feature.
  /// If it is in a draft or paused state,
  /// end-users will see an error if the app tries to open the content.
  ///
  /// known issue:
  /// If the articles feature is not enabled on Intercom account
  /// then opening the article will crash the app on iOS.
  /// see https://forum.intercom.com/s/question/0D52G000050ZFNoSAO/intercom-display-article-crash-on-ios
  static Future<void> displayArticle(String articleId) async {
    return IntercomFlutterPlatform.instance.displayArticle(articleId);
  }

  /// To display a Carousel, pass in a [carouselId] from your Intercom workspace.
  ///
  /// A carousel must be ‘live’ to be used in this feature.
  /// If it is in a draft or paused state,
  /// end-users will see an error if the app tries to open the content.
  static Future<void> displayCarousel(String carouselId) async {
    return IntercomFlutterPlatform.instance.displayCarousel(carouselId);
  }
}
