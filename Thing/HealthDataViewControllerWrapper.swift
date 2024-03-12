import SwiftUI
import UIKit

struct HealthDataViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> HealthDataViewController {
        return HealthDataViewController()
    }
    
    func updateUIViewController(_ uiViewController: HealthDataViewController, context: Context) {
        // Perform any updates when your SwiftUI view's state changes, if necessary
    }
}
