import SwiftUI

struct UserIDInputView: View {
    @State private var userID = ""
    var onUserIDEntered: (String) -> Void

    var body: some View {
        VStack {
            TextField("Enter User ID", text: $userID)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save User ID") {
                onUserIDEntered(userID)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .padding()
    }
}
