
- add package : https://pub.dev/packages/url_launcher (done)
- add following code snippet in android manifest file ()
   ```
    <!-- Provide required visibility configuration for API level 30 and above -->
    <!-- If your application checks for inAppBrowserView launch mode support -->
    <queries>
        <intent>
            <action android:name="android.support.customtabs.action.CustomTabsService" />
        </intent> 
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
        </intent>
    </queries>
    ```

- add logic for launching url ()



















# Aditya Shahi Portfolio

A Portfolio website of Aditya Shahi.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
