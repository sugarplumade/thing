import Foundation

class UserManager {
    static let shared = UserManager()
    
    private init() {}
    
    func saveUserID(_ userID: String) {
        UserDefaults.standard.set(userID, forKey: "currentUserID")
    }
    
    func fetchUserID() -> String? {
        UserDefaults.standard.string(forKey: "currentUserID")
    }
}
