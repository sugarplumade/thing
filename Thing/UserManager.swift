import Foundation

class UserManager {
    static let shared = UserManager()
    
    func saveUserID(_ userID: String) {
        UserDefaults.standard.set(userID, forKey: "currentUserID")
    }
    
    func fetchUserID() -> String? {
        return UserDefaults.standard.string(forKey: "currentUserID")
    }
}

