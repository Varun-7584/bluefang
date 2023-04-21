import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      MKiCloudSync.start(withPrefix: "flutter.sync")

    GeneratedPluginRegistrant.register(with: self)
      MKiCloudSync.start(withPrefix: "flutter.sync")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
