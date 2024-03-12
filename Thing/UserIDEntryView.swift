import Foundation
import SwiftUI

struct UserDataView: View {
    @ObservedObject var userData = UserData() // Consider using @StateObject or passing as a parameter

    var body: some View {
        VStack {
            Text("Steps: \(userData.steps)")
            if let location = userData.lastLocation {
                Text("Location: \(location.latitude), \(location.longitude)")
            } else {
                Text("Location: Unknown")
            }
        }
        .onAppear {
            userData.startLocationUpdates()
        }
    }
}
