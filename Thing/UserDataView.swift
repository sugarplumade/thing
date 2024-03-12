import SwiftUI

struct UserDataView: View {
    @ObservedObject var userData: UserData

    var body: some View {
        VStack {
            Text("Steps: \(userData.steps)")
            if let lastLocation = userData.lastLocation {
                Text("Location: \(lastLocation.latitude), \(lastLocation.longitude)")
            } else {
                Text("Location: Unknown")
            }
        }
    }
}
