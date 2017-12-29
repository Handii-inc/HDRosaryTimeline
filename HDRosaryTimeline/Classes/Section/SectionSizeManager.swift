import Foundation

protocol SectionViewSizeManager: class {
    var gapFromLeft: CGFloat { get }
    var ratioOfDot: CGFloat { get }
    var thickness: CGFloat { get }
    var titleFontSize: CGFloat { get }
}
