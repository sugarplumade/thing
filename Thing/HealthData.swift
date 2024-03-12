import Foundation
import HealthKit

class HealthData: ObservableObject {
    @Published var steps: Int = 0
    let healthStore = HKHealthStore()
    
    init() {
        self.requestAuthorization()
    }
    
    func requestAuthorization() {
        guard HKHealthStore.isHealthDataAvailable(), let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount) else {
            print("HealthKit is not available on this device.")
            return
        }
        
        let readTypes: Set<HKObjectType> = [stepType]
        
        healthStore.requestAuthorization(toShare: [], read: readTypes) { [weak self] (success, error) in
            if success {
                print("HealthKit Authorization Granted.")
                self?.fetchStepCountData()
            } else {
                // Handle errors here
                print("HealthKit Authorization Failed: \(String(describing: error))")
            }
        }
    }
    
    func fetchStepCountData() {
        guard let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return }
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { [weak self] (_, result, error) in
            guard let sum = result?.sumQuantity() else {
                print("Failed to fetch steps: \(String(describing: error))")
                return
            }
            
            let steps = sum.doubleValue(for: HKUnit.count())
            DispatchQueue.main.async {
                self?.steps = Int(steps)
            }
        }
        
        healthStore.execute(query)
    }
}
