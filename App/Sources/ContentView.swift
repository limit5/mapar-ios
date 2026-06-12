// ios-map-ar (OP-1820) - root view for the ARKit + MapKit app.

import SwiftUI

struct ContentView: View {
    var body: some View {
        MapARHomeView()
            // `.contain` makes the root an accessibility container so the
            // identifier actually surfaces in the XCUITest element tree —
            // a bare identifier on a plain container view is dropped.
            .accessibilityElement(children: .contain)
            .accessibilityIdentifier("ContentView.mapARRoot")
    }
}

#Preview {
    ContentView()
}
