// SKILL-IOS (P7 #292) — `@main` SwiftUI entry point.
//
// AppDelegate adapter is wired via `@UIApplicationDelegateAdaptor` so
// the legacy `application(_:didRegisterForRemoteNotificationsWithDeviceToken:)`
// callback can route the APNs token without dropping out of SwiftUI.

import SwiftUI

@main
struct MapARApp: App {


    var body: some Scene {
        WindowGroup {
            ContentView()

        }
    }
}
