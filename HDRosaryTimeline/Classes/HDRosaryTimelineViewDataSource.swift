import Foundation

public protocol HDRosaryTimelineViewDataSource: class {
    func getNumberOfSections() -> Int
    func getNumberOfItems(in section: Int) -> Int
    func getHeaderText(at section: Int) -> String?
    func getText(at indexPath: IndexPath) -> String?
    func getDetailText(at indexPath: IndexPath) -> String?
}
