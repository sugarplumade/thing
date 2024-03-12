import Foundation
import HealthKit
import CoreLocation
import SwiftUI

class UserData: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var steps: Int = 0
    @Published var lastLocation: CLLocationCoordinate2D?

    private let healthStore = HKHealthStore()
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        requestAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    // ... all the HealthKit and CLLocationManagerDelegate methods ...

    // You can remove the 'startLocationUpdates' method if you start location updates in 'init'.
}
