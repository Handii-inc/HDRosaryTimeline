import UIKit
import HDRosaryTimeline

class MealData: HDRosaryTimelineViewDataSource {
    private let data: [(String, [(String, Int)])] = [
        ("2017/7/6 19:00", [("Korean style barbecue", 1500)]),
        ("2017/7/6 13:00", [("Pescatore", 800),
                            ("Green salad", 200)]),
        ("2017/7/6 9:00", [("Butter toast", 400),
                           ("Boiled egg", 150),
                           ("Milk", 150)]),
        ("2017/7/5 19:00", [("Meatloaf", 800),
                            ("Caesar salad", 250),
                            ("Vichyssoise", 200)]),
        ("2017/7/5 13:00", [("Sandwitch", 450),
                            ("Green salad", 200)]),
        ("2017/7/5 9:00", [("Rice", 250),
                           ("Miso soup", 150),
                           ("Fried egg", 180)])
    ]
    
    func getNumberOfSections() -> Int {
        return self.data.count
    }
    
    func getNumberOfItems(in section: Int) -> Int {
        let (_, meals) = self.data[section]
        return meals.count
    }
    
    func getHeaderText(at section: Int) -> String? {
        let (timestamp, _) = self.data[section]
        return timestamp
    }
    
    func getText(at indexPath: IndexPath) -> String? {
        let (_, meals) = self.data[indexPath.section]
        let (name, _) = meals[indexPath.row]
        return name
    }
    
    func getDetailText(at indexPath: IndexPath) -> String? {
        let (_, meals) = self.data[indexPath.section]
        let (_, calory) = meals[indexPath.row]
        return String(describing: calory) + " [kcal]"
    }
}
