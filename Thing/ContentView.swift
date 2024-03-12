import SwiftUI

struct ContentView: View {
    @StateObject private var userData = UserData()
    @State private var userID: String?

    var body: some View {
        VStack {
            if let userID = userID {
                UserDataView(userData: userData)
            } else {
                UserIDInputView { enteredUserID in
                    userID = enteredUserID
                    UserManager.shared.saveUserID(enteredUserID)
                }
            }
        }
        .onAppear {
            userID = UserManager.shared.fetchUserID()
        }
    }
}
