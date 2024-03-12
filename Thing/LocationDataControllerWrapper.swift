import Foundation
import UIKit
import SwiftUI

struct LocationDataViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> LocationDataViewController {
        return LocationDataViewController()
    }

    func updateUIViewController(_ uiViewController: LocationDataViewController, context: Context) {
        // Here you can pass data to the view controller if needed
    }
}
